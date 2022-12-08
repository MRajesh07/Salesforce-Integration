import { LightningElement,api } from 'lwc';

export default class ResumeProgressbarComponent extends LightningElement {
    @api progressLevel ="0";
    get getStyle(){
        return `width:${this.progressLevel}%`
    }
}