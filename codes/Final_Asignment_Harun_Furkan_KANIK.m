%% Explanation for my assignment
%As part of my assignment, I included a spelling check and a test to determine whether the visuals we created in class were selected correctly. 
%Additionally, I created separate rectangles for clothing, fruits, and animals, and added them to the assignment. 
%Since individually reading out letters in the alphabet seemed tedious to me, I decided to add an alphabet song to make it more enjoyable, which I found to be more engaging. 
%Furthermore, I wanted to add my own voice in different places and incorporate background music to make it more fun. 
%In my code, I understand the purpose of each function and why we use them, such as the exit button. 

%% Welcome Screen
clear all
close all
Screen('Preference','SkipSyncTests',1);
[win, screenRect]=Screen('OpenWindow',0,[255 255 255],[0 0 1366 768]);
welcome=imresize(imread('360_F_220214030_D3P5eFfXvY8pz8SEhPeQh27xvbJ1jX1n.jpg'),[768 1366]);
tex=Screen('MakeTexture',win,welcome);
Screen('DrawTexture', win,tex);
Screen(win,'flip');
pause(4);
%% my instruction
[y,fs]=audioread('first introduction 4.m4a'); % I use y,fs - audioread function becuse in matlab we use this code the read audio folder.
sound(y,fs)
DrawFormattedText(win, 'Welcome to the English Lesson!\n You will encounter various activities for practice.\n Kindly adhere to the given instructions.\n Have fun!\n Proceed by pressing any key\n','center','center', [35 70 140],[],[],[],3); 
Screen(win, 'Flip',60 ); 
[secs, keyCode] = KbStrokeWait;
%% second introduction
[y,fs]=audioread('grand statement 5.m4a'); %It's my voice recording, I hope it doesn't sound too bad :)
    sound(y,fs)
    DrawFormattedText(win,'First of all you should listen the activities.\n After that Click -TestYourMemory and spelling test- and test your self :)\n Enjoy Again!',['center'],['center'],[7 16 35],[],[],[],3);
    Screen(win, 'Flip',60 ); 
    pause(20)
%% this code give me an screen and we can see the 6 activities in the same screen and while chlindren making a practice they can start what practice they want.
screenCntrX=screenRect(3)/2;% we use these codes for evaluate the center of the window
screenCntrY=screenRect(4)/2;
    %Category Images 
ImageCatagory=["clothes.jpg","animals.jpg","alphabet.jpeg","fruits.jpeg","spellingtest.jpeg","testyourmemory.jpeg"];
rectSize=300;
gridSize=[3,2];
displaySize=gridSize*rectSize;%we use determine the total size of category boxes
gridCntr=displaySize/2;% also this one we use determine the center of the category grid
rectCount =0;
    %Rectangeles for Categories
for x = 1:rectSize:displaySize(1)
    for y = 1:rectSize:displaySize(2)
        rectCount = rectCount + 1;
        % I arrange the left top corner for rectangle
        topLeftX = screenCntrX - displaySize(1)/2 + x;
        topLeftY = screenCntrY - displaySize(2)/2 + y;
        % I arrange the right bottom corner for rectangle
        bottomRightX = topLeftX + rectSize;
        bottomRightY = topLeftY + rectSize;
        % adding myRects
        myRects(rectCount,:) = [topLeftX, topLeftY, bottomRightX, bottomRightY];
    end
end
%% Choosing Categories
ExitScreen=false;%I add this code beacuse the loop continues as long as the variable ExitScreen remains false. The loop exits when this variable's value is changed later in the code.
while ExitScreen==false
    TotalnmbrRect=rectCount;
    for i=1:TotalnmbrRect
        ImageSelection= imread(ImageCatagory(i)); %this code sequentially draws each image from the ImageCatagory array on the screen. Each drawn image is placed onto the respective rectengular region specifiy in the myRects array.
        tex=Screen('MakeTexture',win, ImageSelection);
        Screen('DrawTexture', win,tex,[],myRects(i,:));
    end
    % I used the AI for puting the exit button
    buttonWidth = 60;
    buttonHeight = 30;
    buttonX = screenRect(3) - buttonWidth; %in here firstly we arrange the place of exit button
    buttonY = 0; 
    Screen(win,'FillRect',[100 100 100],[buttonX buttonY buttonX + buttonWidth buttonY + buttonHeight]);
    DrawFormattedText(win,'EXIT',buttonX,buttonY+30,[0 0 0]); % we put the exit 
    Screen(win,'flip',[],[1]);
     [x, y, buttons] = GetMouse(win);
if any(buttons) && x > buttonX && x < buttonX + buttonWidth && y > buttonY && y < buttonY + buttonHeight
    ExitScreen = true; % and here if the click inside of the exit exitscreen become true 
end
     
     %Category Selection
    notClickYet=true;
    while notClickYet==1
        [x,y,buttons]=GetMouse(win);
        if buttons(1)==1
   %Clotes Category
            if x>myRects(1,1) && x<myRects(1,3) && y>myRects(1,2) && y<myRects(1,4) % we add the each rectangle different lessons 
                notClickYet=false;
                Screen(win,'flip');
                clothlist=["belt.jpg","cape.jpg","dress.jpg","hat.jpg","jacket.jpg","shirt.jpg"];
                clothesSounds=["belt.wav","cape.wav","dress.wav","hat.wav","jacket.wav","shirt.wav"];
                for a=1:6
                    %To show images and sounds simultaneously
                    ClothsImage= imread(clothlist(a));
                    tex=Screen('MakeTexture',win, ClothsImage);
                    Screen('DrawTexture', win,tex,[],[]);
                    pause(1);
                    Screen(win,'flip');
                    [y,fs]=audioread(clothesSounds(a));
                    sound(y,fs)      
                end
                pause(1);       

%Animal Category
            elseif x>myRects(2,1) && x<myRects(2,3) && y>myRects(2,2) && y<myRects(2,4)
                notClickYet=false;
                Screen(win,'flip');
                AnimalList=["ant.jpg","bat.jpg","canary.jpg","cat.jpg","dog.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg","goose.jpg","koala.jpg","lion.jpg","mole.jpg","penguin.jpg","pig.jpg","rabbit.jpg","sheep.jpg","skunk.jpg","swan.jpg","tiger.jpg","zebra.jpg"];
                AnimalSounds=["ant.wav","bat.wav","canary.wav","cat.wav","dog.wav","duck.wav","eagle.wav","fox.wav","goat.wav","goose.wav","koala.wav","lion.wav","mole.wav","penguin.wav","pig.wav","rabbit.wav","sheep.wav","skunk.wav","swan.wav","tiger.wav","zebra.wav"];
                for a=1:21
                    %image are shown and sound also
                    AnimalImage= imread(AnimalList(a));
                    tex=Screen('MakeTexture',win, AnimalImage);
                    Screen('DrawTexture', win,tex,[],[]);
                    pause(1);
                    Screen(win,'flip');
                    [y,fs]=audioread(AnimalSounds(a));
                    sound(y,fs)                    
                end
                pause(1);

%Alphabet Category
            elseif x>myRects(3,1) && x<myRects(3,3) && y>myRects(3,2) && y<myRects(3,4)
                notClickYet=false;
                Screen(win,'flip');
                alphabetlist=["alphabet.jpeg"];
                alphabetSounds=["TunePocket-The-Alphabet-Song-Preview.mp3"];%Instead of boring alphabet readings, I added an alphabet song, I think it was much better :))
                    %same process like animal catagory also here
                    AlphabetImage= imread(alphabetlist); 
                    tex=Screen('MakeTexture',win, AlphabetImage);
                    Screen('DrawTexture', win,tex,[],[]);
                    pause(1);
                    Screen(win,'flip');
                    [y,fs]=audioread(alphabetSounds);
                    sound(y,fs)                    
                pause(5);%normally I paused same time with the music but I just pause 5 sec because you can easyly turnback the homescreen .d
%Fruits Category
            elseif x>myRects(4,1) && x<myRects(4,3) && y>myRects(4,2) && y<myRects(4,4)
                notClickYet=false;
                Screen(win,'flip');
                Fruitslist=["banana.jpg","cherry.jpg","kiwi.jpg","lemon.jpg","peach.jpg","pumpkin.jpg","tomato.jpg"];
                FruitsSounds=["banana.wav","cherry.wav","kiwi.wav","lemon.wav","peach.wav","pumpkin.wav","tomato.wav"];
                for i=1:7
                    %again images and sound show here simultaniously
                    FruitsImage= imread(Fruitslist(i));
                    tex=Screen('MakeTexture',win, FruitsImage);
                    Screen('DrawTexture', win,tex,[],[]);
                    pause(1);
                    Screen(win,'flip');
                    [y,fs]=audioread(FruitsSounds(i));
                    sound(y,fs)
                end
                pause(1);
              
%Exit Click
            elseif  x > buttonX && x < buttonX + buttonWidth && y > buttonY && y < buttonY + buttonHeight
                notClickYet=false;
                ExitScreen=true;
                sca
% spelling control
elseif x > myRects(5,1) && x < myRects(5,3) && y > myRects(5,2) && y < myRects(5,4)
    notClickYet = false;
    Screen(win, 'flip');
    name = ["ant", "bat", "canary", "cat", "dog", "duck", "eagle", "fox", "goat", "goose", "koala", "lion", "mole", "penguin", "pig", "rabbit", "sheep", "skunk", "swan", "tiger", "zebra"];
    truespelling = ["ant", "bat", "canary", "cat", "dog", "duck", "eagle", "fox", "goat", "goose", "koala", "lion", "mole", "penguin", "pig", "rabbit", "sheep", "skunk", "swan", "tiger", "zebra"];
    DrawFormattedText(win,'Lets learn how can we write? Write the animal you heard and check it is true or not.\n If it is true you can continue test your other animals name spelling test .\n If it is not true do it again until you find correct spelling', 'center','center')
    Screen(win,'Flip');
    % We put to get a input from users
    typedName = ''; % to record the name typed
    while true
        [keyTime, keyCode] = KbStrokeWait;
        keyPressed = KbName(keyCode); 
        if strcmp(keyPressed, 'return') 
            break
        end
        typedName = [typedName keyPressed]; % to concatenate
        DrawFormattedText(win, typedName, 'center', 'center');
        Screen(win, 'Flip');
    end
    % correct or not
    idx = find(strcmp(truespelling, typedName)); % to match the name with correct spelling
    if ~isempty(idx) % if it is true % I learnd this code from AI this is control the my cell array is emty meaning has no element. if the array is empty the function returns 'true' if it is not empty return'false'
        %for this reason we can easily play correct and not correct sound
        %according to the children
        [y, fs] = audioread('correct.m4a');
        sound(y, fs);
        Screen(win, 'Flip');
        WaitSecs(2); 
    else % if it is wrong
        [y, fs] = audioread('notcorret.m4a');
        sound(y, fs);
        Screen(win, 'Flip');
        WaitSecs(2); 
    end
              
                
                
                % Memory-Test Category
     elseif x>myRects(6,1) && x<myRects(6,3) && y>myRects(6,2) && y<myRects(6,4)
     notClickYet=false;
     Screen(win,'flip');
                
     shownimages=[]; %I put empty space for record the images wich image will be shown
     notshownimages=[];

     shownSounds=[]; %I also put empty space to record which sound will be shown
     notshownSounds=[];

     fileList = ["ant.jpg","bat.jpg","canary.jpg","cat.jpg","dog.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg"]; % list of all images
     allSounds=["ant.wav","bat.wav","canary.wav","cat.wav","dog.wav","duck.wav","eagle.wav","fox.wav","goat.wav"];

     shuffleList = Shuffle(fileList); %we use for shuffling the images
     shuffleSounds = Shuffle(allSounds);

     imageSize=screenRect(4)/1000; %I aim to render the images imperceptible as I desire solely the perception of sounds. I utilize images (albeit imperceptibly) in tandem with sounds to establish associations between displayed images and authentic clicks. Despite their apparent absence, I employ images alongside sounds simultaneously, yet the examinee will rely solely on sounds to match the images. 
     middle = screenRect * 0.5;
     DrawFormattedText(win, 'You will hear 4 different animal words\nWhen you are ready, you can press any key to start\nGOOD LUCK :)','center','center'); 
     Screen(win, 'Flip' );
     [secs, keyCode] = KbStrokeWait;
     for kk=1:4 %
    
     fileName = shuffleList(kk); 
     myImage = imread(fileName);
     tex = Screen('MakeTexture',win, myImage);
     Screen('DrawTexture', win,tex,[],[middle(3)-imageSize, middle(4)-imageSize, middle(3)+imageSize, middle(4)+imageSize]); %to draw the texture in the center
     Screen(win,'Flip'); 
    
    
     shownimages = shuffleList(1:4); % I record which image was shown
     indexshownimage=find(fileList==shownimages(kk)); %With the function of find, I aimed to find the index of which images have been showed, and then play the sounds of showed images. The index helps me synchronize the shuffled images and shuffled sounds.
     indexshownimage;
                    
     notshownimages = shuffleList(5:9); % also I record unshown images record   
     [y,fs]=audioread(allSounds(indexshownimage)); % sounds
     sound(y,fs)
     pause(1);   
     shownSounds = shuffleSounds(1:4);
     notshownSounds = shuffleSounds(5:9);
    
  end

%instractuin for memory test

        DrawFormattedText(win, 'Click only on the image you just heard\n Press any key to begin','center','center'); 
        Screen(win, 'Flip' );
        [secs, keyCode] = KbStrokeWait; 

        % I am going to show 9 images and the other 4 images already
        % mantion will show in here

        % to make grids rectangle
        RectSize = 300; 
        GridSize = 3; 
        DisplaySize = GridSize*RectSize
        RectCount = 0; %starting point
        for x = 1:RectSize:DisplaySize
            for y = 1:RectSize:DisplaySize 
            RectCount = RectCount+1; 
            MyRects(RectCount,:) = [x y x+RectSize/2 y+RectSize/2]; %coordinates of Rects
            end
        end
        % put rectangles on the center
        screenCntrX=screenRect(3)/2;
        screenCntrY = screenRect(4)/2;


        gridCntr = DisplaySize/2;
        MyRects(:,[1 3]) = MyRects(:,[1 3])+screenCntrX-gridCntr+RectSize/4
        MyRects(:,[2 4]) = MyRects(:,[2 4])+screenCntrY-gridCntr+RectSize/4

        totalNumberRect = RectCount; 
        fileList = ["ant.jpg","bat.jpg","canary.jpg","cat.jpg","dog.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg"]; % list of all images

        shuffleList2 = Shuffle(fileList); 
        for k=1:totalNumberRect
        myImage1=imread(shuffleList2(k)); 
        tex1=Screen('MakeTexture',win, myImage1);
        Screen('DrawTexture', win,tex1,[],MyRects(k,:));
        end 
    Screen(win,'Flip')
     

        hits = 0; %this is correct click
        numClicks = 0; %this is total click
        correctClicks = shuffleList(1:4);
        while hits <4
        [mouseX,mouseY,buttons] = GetMouse(win); %the mouse setting
     if buttons(1) == 1 %correct click by left
          for k=1:totalNumberRect 
            OneRect=MyRects(k,:);
            if mouseX>OneRect(1)&& mouseX<OneRect(3) && mouseY>OneRect(2) && mouseY<OneRect(4) %to check coordinates
                MyRects(k,:)=0; %when the participant click the images this is make disappeard image 
                clickedRects(k) = shuffleList2(k);
                checkClicks = ismember(clickedRects,correctClicks)
             if checkClicks (k) == 1 %when correct hit
                    hits = hits+1 %to calculate total number of hits
                    [y,fs]=audioread("correcttt.m4a"); %this is my voice. I would like to make it fun for this reason I add my voice .d
                    sound(y,fs) 
                else numClicks=numClicks+1 
                end
            end
            myImage3 = imread(shuffleList2(k)); %to refresh the screen each time
                tex3=Screen('MakeTexture',win, myImage3);
            Screen('DrawTexture', win,tex3,[],MyRects(k,:)); %to show the same images at the same position after clicked it
             end
        Screen(win,'Flip')
            end              
        end

    accuracy=(hits/(hits+numClicks))*100; %to calculate accuracy
    accuracytext =['The accuracy of your performance: ' num2str(accuracy) '%']
    DrawFormattedText(win, accuracytext,'center','center');
    Screen(win,'Flip');
   
    
    pause(2)


            end
        end
    end
end











