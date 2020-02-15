import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactCntrll.getContactList';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
//import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
//import ID_FIELD from '@salesforce/schema/Contact.Id';
//import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
//import EMAIL_FIELD from '@salesforce/schema/Contact.Email';


const cols = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Title', fieldName: 'Title' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true },
    { label: 'Email', fieldName: 'Email', type: 'email', editable: true }
];
export default class DataTableWithMultipleRowsEdit extends LightningElement {
    @track error;
    @track columns = cols;
    @track draftValues = [];

    @wire(getContactList)
    contact;
    handleSave(event) {
        const recordInputs =  event.detail.draftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contacts updated',
                    variant: 'success'
                })
            );
            // Clear all draft values
            this.draftValues = [];
            // Display fresh data in the datatable
            return refreshApex(this.contact);
        })
 
    }
    
}