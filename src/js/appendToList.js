/**
 * appendToList
 *
 * Description: Appends a value returned by a dialog to an item (or items) 
 * containing a list of values separated by a character (default: :)
 *
 * Author: Diego Gerena (SniperCat)
 * WebSite: https://snipercatexperiences.blogspot.com/
 * Version: 1.0.0
 * License: MIT (https://opensource.org/licenses/MIT)
 * Last Updated: 2023-07-25
 */

var appendToList = {
    //function that gets called from plugin
    execute: function() {
		// get the value of the parammeters
		let retItem  = this.action.attribute01; //Return Item
		let sepChar  = this.action.attribute02; //Separator Character
		let itemsList  = this.action.affectedElements.split(','); //Affected Items
		
		let newval; 
		//Get data from variables
		let appendValue = eval('this.data.'+retItem);

		//Iterate over affected items
		for (let item of itemsList) {
			//Get Item Value
			let stringList = $v(item);
			
			//If the list is empty, set the value
			if (stringList.length == 0){
				newval = appendValue;
			}else{
				// String to array
				let ArrayList = stringList.split(sepChar);

				//Verify if the value already exists to avoid duplicate
				var incluye = ArrayList.includes(appendValue);
				if (  !incluye  ){
					ArrayList.push(appendValue);
				}
					newval = ArrayList.join(sepChar);
			}
			//Set the new value to the item
			$s(item,newval);
		}
	}
};