const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');
class BooksODataService extends cds.ApplicationService {
    init() {
        const { Employees } = this.entities;
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
        return super.init();
    }
}

module.exports = BooksODataService;