const cds = require('@sap/cds');
class BooksODataService extends cds.ApplicationService {
    init() {
        const { Employees } = this.entities;
        this.before('UPDATE', Employees.drafts, (req) => {
            debugger;
            if(req.data?.email){
                let regex = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
                let val = regex.test(req.data?.email);
                if(!val){
                    req.reject({
                        status: 400,
                        target: 'email',
                        message: 'Please enter correct email address'
                    });
                }
            }
        });
        return super.init();
    }
}

module.exports = BooksODataService;