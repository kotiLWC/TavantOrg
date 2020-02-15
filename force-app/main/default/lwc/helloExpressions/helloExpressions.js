import { LightningElement, track} from 'lwc';

export default class HelloExpressions extends LightningElement {
    @track firstName ='';
    @track lastName='';

    handleChange(evt){
        const field = evt.target.name;
        if (field === 'firstName') {
            this.firstName = evt.target.value;
        } else if (field === 'lastName') {
            this.lastName = evt.target.value;
        }
    }
    get uppercasedFullName() {
        return `${this.firstName} ${this.lastName}`.toUpperCase();
    }

}