using {com.sap.tables as model} from '../db/data-model';

service BooksODataService {
    @odata.draft.enabled
    entity Employees   as projection on model.Employees;
    entity Manager     as projection on model.Manager;
    entity Designation as projection on model.Designation;
    entity Departments as projection on model.Departments;
}
