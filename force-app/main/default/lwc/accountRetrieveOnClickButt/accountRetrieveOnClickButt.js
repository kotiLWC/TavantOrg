import { LightningElement, track } from 'lwc';
import getAccountList from '@salesforce/apex/ApexWireMethodToPropertyCls.getAccountList';
export default class AccountRetrieveOnClickButt extends LightningElement {
    @track accounts;
    @track error;
    handleLoad() {
        getAccountList()
            .then(result=> {
                this.accounts=result;
            })
            .catch(error => {
                this.error = error;
            });
    }

}