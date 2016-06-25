/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2


Page {
    
    
    Container 
    {
        id: containerID
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        //topPadding: 20.0
        
        background: Color.create ("#262626")
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        
        Container {
            background: Color.Green
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Top
            preferredHeight: 100
        
            Label {
                // Localized text with the dynamic translation and locale updates support
                //text: qsTr("Hello World") + Retranslate.onLocaleOrLanguageChanged
                text: qsTr("வணக்கம்") + Retranslate.onLocaleOrLanguageChanged
                textStyle.base: SystemDefaults.TextStyles.BigText
                horizontalAlignment: HorizontalAlignment.Center 
            }
        }
        
        Container {
            
           layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
           
            Container {
               background: Color.Cyan
               topPadding: 5
               bottomPadding: 5
               rightPadding: 2
               leftPadding: 2
               minWidth: 650
               layout: StackLayout {
                   orientation: LayoutOrientation.TopToBottom
               }

               
               ListView {
                   	id: itemRoot
                   	layout: GridListLayout {
                           orientation: LayoutOrientation.TopToBottom
                   	}
                   	rootIndexPath: [1]
                   	dataModel: XmlDataModel { source: "S_List.xml" }
                    listItemComponents: [
                        ListItemComponent {
                            type: "header"
                            
                            Label {
                                text: ListItemData.title
                            }
                        },
                        
                    	ListItemComponent {
                        	type: "item"
                        	
                        	//Container {
                                //layout: GridListLayout {}
                                
                            Label {
                                text: ListItemData.title
                            }
                        }
                    ]
                    
                    onTriggered: {
                        // Update the Label with the name and PIN
                        // for the selected list item
                        var selectedItem = dataModel.data(indexPath);
                        console.log("Selected Item:  " + selectedItem.title);
                        console.log("Index #:  " + indexPath);
                    }

                    
                    	//---------------SingleSelect - Start!
                    		
                    		
                    		//opacity: itemRoot.ListItem.selected ? 1.0 : 0.5
                    		/*opacity: 
                    		{
                        		if (itemRoot.ListItem.selected)
                    	   		{
                    		  		1.0
                    		    }
                        	
                        		else
                        		{
                          	  		0.5 
                                }
                            }*/
                        
                    
                    
                   
                    
                    //---------------SingleSelect - End!
                    
                    
                    //---------------MultiSelect - Start!   
                    // This multi-select action will be placed inside the ActionSets of each 
                    // list item that doesn't have a MultiSelectActionItem of its own.
                    multiSelectAction: MultiSelectActionItem {}
                       
                    multiSelectHandler {
                        // These actions will be shown during multiple selection, while this 
                        // multiSelectHandler is active
                        actions: [
                           ActionItem {title: "Multi-select action"},
                            DeleteActionItem {}
                        ]
                           
                         status: "None selected"
                           
                        onActiveChanged: {
                              if (active == true) {
                                  console.log("Multiple selection is activated");
                              }
                             else {
                                  console.log("Multiple selection is deactivated");
                            }
                        }
                    }
                    //---------------MultiSelect - End!

                 
               }
            }
        
           Container {
               background: Color.Cyan
               topPadding: 1
               bottomPadding: 1
               rightPadding: 2
               leftPadding: 2
               minWidth: 10
               layout: StackLayout {
                   orientation: LayoutOrientation.TopToBottom
                   
               }
               
               ListView {
					rootIndexPath: [0]
					dataModel: XmlDataModel { source: "S_List.xml" }
					
					
                    onTriggered: {
                        // Update the Label with the name and PIN
                        // for the selected list item
                        //var selectedItem = dataModel.data(indexPath)
                        
                        var selectedItem = dataModel.data(indexPath)
                        var indexVal = 0
                        
                        //function testIndex (QVariant[] indexPath )
                        //{
                        
                        if(indexPath == "0,0")
                        {
                        	indexVal = 0
                            itemRoot.rootIndexPath = [1]
                            
                        }
                        if(indexPath == "0,1")
                        {
                            indexVal = 1
                            itemRoot.rootIndexPath = [2]
                        
                        }
                        if(indexPath == "0,2")
                        {
                            indexVal = 2
                            itemRoot.rootIndexPath = [3]
                        
                        }
                        if(indexPath == "0,3")
                        {
                            indexVal = 3
                            itemRoot.rootIndexPath = [4]
                        
                        }
                        if(indexPath == "0,4")
                        {
                            indexVal = 4
                            itemRoot.rootIndexPath = [5]
                        
                        }
                        
                        	
                        //}                   
                        //const int index = indexPath[0].toInt()
                        //var index, index2  = indexPath[0].toInt
                        //var index  = indexPath[0].currentIndex
                        //var index = dataModel.childCount([])
                        //var index = dataModel.currentIndex([])
                        console.log("Selected Item:  " + selectedItem.title);
                        console.log("Index #:  " + indexPath);
                        textField.text = selectedItem.title;
                        console.log("Index #:  " + indexVal);
                    }
               }   
           }
       }
           
        Container {
               background: Color.Green
               minHeight: 200
               layout: StackLayout {
                   orientation: LayoutOrientation.TopToBottom
               }
               
               
               // Create a text field to display the status of the selected item
               TextField {
                   id: textField
                   horizontalAlignment: HorizontalAlignment.Left
                   verticalAlignment: VerticalAlignment.Fill
                   text: "Hello: "
               }
           }
    }

               
               
           


    	/*	Container {
       	 		//Todo: fill me with QML
         		background: Color.Cyan
         		topPadding: 20
          		bottomPadding: 10
           	 	rightPadding: 20
             	leftPadding: 20
             	//horizontalAlignment: HorizontalAlignment.Left
             	//verticalAlignment: VerticalAlignment.Fill
        
        		layout: StackLayout {
        		orientation: LayoutOrientation.TopToBottom
        		}
 
        		Button {
           	 		text: "அ"
             		layoutProperties: StackLayoutProperties {
                	spaceQuota: 1
                	}
                }
        	    Button {
            	   	text: "க்"
            	   	layoutProperties: StackLayoutProperties {
                	spaceQuota: 1
                	}
                }
                Button {
            	   	 text: "ங்"
            	   	 layoutProperties: StackLayoutProperties {
                	 spaceQuota: 1
                	 }
                }        

            	}

    		Container {
            	horizontalAlignment: HorizontalAlignment.Left
            	verticalAlignment: VerticalAlignment.Fill
        	   	Button {
            		text: "ங்"
            		layoutProperties: StackLayoutProperties {
                	spaceQuota: 1
                	 }
                }   
            }*/
        
    
}


