import { LightningElement,api } from 'lwc';

export default class ResumeSummaryComponent extends LightningElement {
    @api carrerSummary
        connectedCallback() {
            console.log(this.carrerSummary +"hello ");
    }
}