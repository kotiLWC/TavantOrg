/* eslint-disable @lwc/lwc/no-async-operation */
import { LightningElement, track, wire } from 'lwc';
import findAccounts from '@salesforce/apex/ApexWireMethodToPropertyCls.findAccounts';
/** The delay used when debouncing event handlers before invoking Apex. */
const DELAY = 300;
export default class ApexWireMethodWithParamsSearch extends LightningElement {
    @track searchKey = '';

    @wire(findAccounts, { searchKey: '$searchKey' })
    accounts;
    handleKeyChange(event) {
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}