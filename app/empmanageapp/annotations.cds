using BooksODataService as service from '../../srv/service';
using from '../../db/data-model';

annotate service.Employees with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : department.description,
            Label : 'Department',
        },
        {
            $Type : 'UI.DataField',
            Value : designation.description,
            Label : '{i18n>Designation}',
        },
        {
            $Type : 'UI.DataField',
            Value : city,
            Label : 'city',
        },
        {
            $Type : 'UI.DataField',
            Value : country,
            Label : 'country',
        },
        {
            $Type : 'UI.DataField',
            Value : address,
            Label : 'address',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'email',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EmployeeDetails}',
            ID : 'i18nEmployeeDetails',
            Target : '@UI.FieldGroup#i18nEmployeeDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>ManagerDetails}',
            ID : 'i18nManagerDetails',
            Target : '@UI.FieldGroup#i18nManagerDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>FamilyMembers}',
            ID : 'i18nFamilyMembers',
            Target : 'familyMembers/@UI.LineItem#i18nFamilyMembers',
        },
    ],
    UI.FieldGroup #i18nEmployeeDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : city,
                Label : 'city',
            },
            {
                $Type : 'UI.DataField',
                Value : country,
                Label : 'country',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : salary,
                Label : 'salary',
            },
            {
                $Type : 'UI.DataField',
                Value : department_code,
            },
            {
                $Type : 'UI.DataField',
                Value : designation_code,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Status',
            },
        ],
    },
    UI.FieldGroup #i18nManagerDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : manager.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.designation,
                Label : 'designation',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.department,
                Label : 'department',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.country,
                Label : 'country',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.city,
                Label : 'city',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : manager.name,
                Label : 'name',
            },
        ],
    },
    UI.SelectionFields : [
        department_code,
        designation_code,
    ],
);

annotate service.Employees with {
    department @(
        Common.Label : '{i18n>Department}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Departments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : department_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
        Common.Text : department.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Employees with {
    designation @(
        Common.Label : '{i18n>Designation}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Designation',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : designation_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
        Common.Text : designation.description,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Departments with {
    code @(
        Common.Text : description,
        )
};

annotate service.Designation with {
    code @Common.Text : description
};

annotate service.FamilyMembers with @(
    UI.LineItem #i18nFamilyMembers : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
            Label : 'firstName',
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            Label : 'lastName',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'email',
        },
        {
            $Type : 'UI.DataField',
            Value : phone,
            Label : 'phone',
        },
        {
            $Type : 'UI.DataField',
            Value : relationship,
            Label : 'relationship',
        },
        {
            $Type : 'UI.DataField',
            Value : address,
            Label : 'address',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Family Details',
            ID : 'FamilyDetails',
            Target : '@UI.FieldGroup#FamilyDetails',
        },
    ],
    UI.FieldGroup #FamilyDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : firstName,
                Label : 'firstName',
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
                Label : 'lastName',
            },
            {
                $Type : 'UI.DataField',
                Value : phone,
                Label : 'phone',
            },
            {
                $Type : 'UI.DataField',
                Value : relationship,
                Label : 'relationship',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : address,
                Label : 'address',
            },
        ],
    },
);

annotate service.Employees with {
    status @Common.FieldControl : #ReadOnly
};

