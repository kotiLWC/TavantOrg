import { LightningElement, wire, track } from 'lwc';
import getAccountList from '@salesforce/apex/ApexWireMethodToPropertyCls.getAccountList';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ID_FIELD from '@salesforce/schema/Account.Id';

const columns = [
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone',editable: true },
];

export default class DataTableAccountLWC extends LightningElement {
    @track error;
    @track columns = columns;
    @track draftValues = [];

@wire(getAccountList)
    contact;

    handleSave(event) {
        const fields = {};
        fields[ID_FIELD.fieldApiName] = event.detail.draftValues[0].Id;
        fields[NAME_FIELD.fieldApiName] = event.detail.draftValues[0].Name;
        fields[PHONE_FIELD.fieldApiName] = event.detail.draftValues[0].Phone;

        const recordInput = {fields};
        updateRecord(recordInput)
        .then(()=> {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact updated',
                    variant: 'success'
                })
            );
            // Clear all draft values
            this.draftValues = [];
            // Display fresh data in the datatable
            return refreshApex(this.contact);
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error'
                })
            );

        });
    }
}