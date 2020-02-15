import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import RATE_FIELD from '@salesforce/schema/Account.Rating';


export default class CreateRecordwithCustomFieldLayout extends LightningElement {
    accountObject = ACCOUNT_OBJECT;
    nameField = NAME_FIELD;
    websiteField = WEBSITE_FIELD;
    rateField = RATE_FIELD;

    handleAccountCreated(){
        // Run code when account is created.
    }
}