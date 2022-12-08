import { LightningElement } from 'lwc';
import *as ResumeData from './resumeDataContainer';
export default class ResumeContainer extends LightningElement {
    profileImage = ResumeData.MyProfileImage;
    socialLinks = ResumeData.Social_Links;
    resumeData = ResumeData;
}