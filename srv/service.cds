using {com.sap.tables as model} from '../db/data-model';
using {SDHeaderService as externalModel} from './external/SDHeaderService';

service BooksODataService {
    @odata.draft.enabled
    entity Employees @(restrict: [{
        grant: [
            'READ',
            'WRITE'
        ],
        to   : [
            'employee',
            'manager'
        ]
    }])                as projection on model.Employees;

    entity Manager @(restrict: [{
        grant: [
            'READ',
            'WRITE'
        ],
        to   : ['manager']
    }])                as projection on model.Manager;

    entity Designation as projection on model.Designation;
    entity Departments as projection on model.Departments;
    entity SDHEADERSet as projection on externalModel.SDHEADERSet;
    action   setEmployeeStatus(empID: String) returns String;

    function getValueHelpData()               returns String;
}
