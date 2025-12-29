namespace com.sap.tables;

using {
    cuid,
    managed,
    Country
} from '@sap/cds/common';


type commonLengthForName : String(50);

entity Employees : cuid, managed {
    name          : String(50) @title: 'Name';
    address       : String(250);
    email         : String(50);
    country       : String(50);
    city          : String(50);
    designation   : Association to Designation;
    department    : Association to Departments;
    salary        : Decimal(10, 2);
    manager       : Association to Manager;
    familyMembers : Composition of many FamilyMembers
                        on familyMembers.employee = $self;
}

entity Manager : cuid, managed {
    name        : String(50);
    address     : String(250);
    email       : String(50);
    country     : String(50);
    city        : String(50);
    designation : String(50);
    department  : String(50);
    employees   : Composition of many Employees
                      on employees.manager = $self;
}

entity FamilyMembers : cuid, managed {
    firstName    : String(20);
    lastName     : String(20);
    email        : String(50);
    relationship : String(50);
    address      : String;
    phone        : String;
    employee     : Association to Employees;
}

entity Designation {
    key code        : String;
        description : String;
}

entity Departments {
    key code        : String;
        description : String;
}
