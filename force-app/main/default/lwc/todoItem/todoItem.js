import { LightningElement, api} from 'lwc';

export default class TodoItem extends LightningElement {
    @api
    get itemName() {
        return this._itemName;
    }

    set itemName(value) {
       this._itemName = value.toUpperCase();
    }
}