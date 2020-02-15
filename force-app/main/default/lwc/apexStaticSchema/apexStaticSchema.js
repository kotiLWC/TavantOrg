import { LightningElement, wire  } from 'lwc';
import { getSObjectValue } from '@salesforce/apex';
import getSingleAccount from '@salesforce/apex/ApexWireMethodToPropertyCls.getSingleAccount';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
export default class ApexStaticSchema extends LightningElement {
    @wire(getSingleAccount) account;

    get name() {
        return this.account.data ? getSObjectValue(this.account.data, NAME_FIELD) : '';
    }
    get phone() {
        return this.account.data ? getSObjectValue(this.account.data, PHONE_FIELD) : '';
    }
}