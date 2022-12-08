import { api, LightningElement } from 'lwc';

export default class ResumeHeader extends LightningElement {
    @api profileImage;
    @api socialLinks;
    @api userDetails;
    
    get email() {
        return `mailto:${this.userDetails.Email}`
    }
    get phone() {
        return `tel:${this.userDetails.PhoneNumber}`
    }
}