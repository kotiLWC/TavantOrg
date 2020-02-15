// wrapper.js
import { LightningElement, track } from 'lwc';

export default class Wrapper extends LightningElement {
    @track recordId;

    /**
     * Handles the new record event.
     */
    handleNewRecord(evt) {
        const recordId = evt.detail.data.id;
        this.recordId = recordId;
    }
}