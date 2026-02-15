const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');
class BooksODataService extends cds.ApplicationService {
    async init() {
        const { Employees, SDHEADERSet } = this.entities;
        const externalServer = await cds.connect.to("SDHeaderService");

        this.on('READ', SDHEADERSet, async (req) => {
            return externalServer.run(req.query);
        });

        this.before('UPDATE', Employees.drafts, (req) => {
            debugger;
            if (req.data?.email) {
                let regex = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; //Regular expression
                let val = regex.test(req.data?.email);
                if (!val) {
                    req.reject({
                        status: 400,
                        target: 'email',
                        message: 'Please enter correct email address' // Warning message
                    });
                }
            }
        });

        this.on('setEmployeeStatus', async (req) => {
            try {
                let empid = req.data.empID;
                if (empid) {
                    let updated = await UPDATE(Employees, empid).with({
                        status: "Activated"
                    });
                    if (updated) {
                       return req.info("Status Updated Successfully!");
                    }
                }
            } catch (error) {
                req.reject(400, "Failed to Update Status");
            }
        });

        this.on('getValueHelpData', async (req) => {
            let dbquery = `Call "BASICPRODE"( DEPARTMENT_DATA=>?, DESIGNATION_DATA=>? )`;
            let data = await cds.run(dbquery); // Get query 
            if(data){
                let result = {
                    departmentArray: data.DEPARTMENT_DATA,
                    designationArray: data.DESIGNATION_DATA
                }

                return result;
            }

            return req.error(404, "Failed to call procedure!");
        });
        return super.init();
    }
}

module.exports = BooksODataService;