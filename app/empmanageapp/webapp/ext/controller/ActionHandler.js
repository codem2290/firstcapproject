sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        onUpdateStatus: function (oContext, aSelectedContexts) {
            //MessageToast.show("Custom handler invoked.");
            var sAction = "setEmployeeStatus";
            var oParameter = {
                model: this.getModel(),
                parameterValues: [
                    {
                        "name": "empID",
                        "value": oContext.getObject().ID
                    }
                ],
                skipParameterDialog: true
            };
            this.editFlow.invokeAction(sAction, oParameter).then(function (result) {
                this._controller.getExtensionAPI().refresh();
            }.bind(this));

        }
    };
});
