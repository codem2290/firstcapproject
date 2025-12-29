sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/employee/empmanageapp/test/integration/pages/EmployeesList",
	"com/demo/employee/empmanageapp/test/integration/pages/EmployeesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/employee/empmanageapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage
        },
        async: true
    });

    return runner;
});

