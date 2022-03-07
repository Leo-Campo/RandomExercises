import { LightningElement, track } from 'lwc';
import searchForAccount from '@salesforce/apex/SearchAccount.searchForAccount';

export default class SearchAccount extends LightningElement {
    @track accountToDisplay;
    nameToLookFor;
    displayError = false;
    displayRecord = false;


    saveName(event){
        this.nameToLookFor = event.target.value;
    }

    displayResults(){
        searchForAccount({ name:this.nameToLookFor }).then(
            result => {
                    this.accountToDisplay = result;
                    if (this.accountToDisplay){
                        this.displayRecord = true;
                        this.displayError = false;
                    }
                    else{
                        this.displayError = true;
                        this.displayRecord = false;
                    }
                });
    }


}