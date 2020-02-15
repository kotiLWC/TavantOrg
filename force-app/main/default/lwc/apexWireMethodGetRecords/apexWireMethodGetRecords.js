import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/ApexWireMethodToPropertyCls.getAccountList';
export default class ApexWireMethodGetRecords extends LightningElement {
    @wire(getAccountList) accounts;
}