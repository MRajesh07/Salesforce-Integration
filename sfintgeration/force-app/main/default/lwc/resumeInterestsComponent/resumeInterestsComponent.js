import { LightningElement,api } from 'lwc';

export default class ResumeInterestsComponent extends LightningElement {
    @api interestList
    @api heading
    @api type
    get isHeading() {
        return `slds-var-m-top_medium ${this.type==="main"? 'section_heading' : 'section_subHeading'}`
    }
}