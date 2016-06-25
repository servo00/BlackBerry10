import bb.cascades 1.2

/*Page {
    Container {
        //Todo: fill me with QML
        Label {
            // Localized text with the dynamic translation and locale updates support
            text: qsTr("Hello World") + Retranslate.onLocaleOrLanguageChanged
            textStyle.base: SystemDefaults.TextStyles.BigText
        }
    }
}*/
Page 
{
    Container 
    {
        id: containerID
        layout: StackLayout {}
        topPadding: 20.0
        background: Color.create ("#262626")
        
        // The images container
        //The order in which you add the images to the container determines how they are layered.
        Container 
        {
            horizontalAlignment: HorizontalAlignment.Center
            layout: DockLayout {}
            
            // The night image
            ImageView 
            {
                //Assign the image an ID so that we can access its opacity property from our slider. 
                id: night
                imageSource: "asset:///images/night.jpg"
                horizontalAlignment: HorizontalAlignment.Center
            }
            
            // The day image. Opacity is set to 0.0 on construction
            // so that the night image is visible behind it.
            ImageView 
            {
                //Assign the image an ID so that we can access its opacity property from our slider. 
                id: day
                opacity: 0
                imageSource: "asset:///images/day.jpg"
                horizontalAlignment: HorizontalAlignment.Center
            }
        } // End of the images container    
        
        // The slider container
        Container 
        {
            leftPadding: 20
            rightPadding: 20
            topPadding: 25
            bottomPadding: 25
            layout: StackLayout 
            {
                orientation: LayoutOrientation.LeftToRight
            }
            
            // The moon icon
            ImageView 
            {
                imageSource: "asset:///images/moon.png"
                verticalAlignment: VerticalAlignment.Center
            }
            // The slider used to adjust the opacity of the image
            Slider 
            {
                leftMargin: 20
                rightMargin: 20
                horizontalAlignment: HorizontalAlignment.Fill
                layoutProperties: StackLayoutProperties 
                {
                    spaceQuota: 1
                }              
                onImmediateValueChanged: 
                {
                    // This is where the day-night opacity
                    // value is set.
                    day.opacity = immediateValue;
                    
                }
            }
            // The sun icon
            ImageView 
            {
                imageSource: "asset:///images/sun.png"
                verticalAlignment: VerticalAlignment.Center
            }
        } // End of the slider container
    } // End of the root container
    
} // End of the page