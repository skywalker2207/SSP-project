# SSP-project
LID using prosodic features (syllable level)
![Screenshot from 2022-10-25 20-59-16](https://user-images.githubusercontent.com/82716184/197816793-a449ef56-489b-454b-a696-645dacdb1b24.png)

This projects implements LID(Language Identification) using solely prosody features on the syllable level.
Steps to run the code:

1. Take the dataset and convert .wav to .mat using prosody.m
2. Place the code into the below folder structure
3. Run the code using GMM.ipynb


Code Structure:

testdata________                    _____ 
          |
          |_____    Language Folders_____       languageN.mat
          |
          |_____                    _____

    testdata is the folder where the test data is placed. The code will automatically read the test data from this folder. It must be in the 
    .mat format. Each file is placed in its respective format with the naming convention being languageN.mat where language is its language and N is the serial number.

traindata_______                    _____ 
          |
          |_____    Language Folders_____       languageN.mat
          |
          |_____                    _____
    
    traindata is the folder where the train data is placed. The code will automatically read the train data from this folder. It must be in the
    .mat format. Each file is placed in its respective format with the naming convention being languageN.mat where language is its language and N is the serial number.

GMM.ipynb

    This is the main code file. It contains the code for the GMM implementation.

prosody.m

    This is the code which extract the prosody syllable level features  from the .wav file. It is used to convert the .wav file to .mat file.

VOP.m

    This is the code which extract the syllable boundary information from the .wav file.

voiced.m

    This is the code which extract the voiced/unvoiced information from the .wav file.

freq.m

    This is the code which extract the fundamental frequency information from the .wav file.

The code will automatically create the following folders:


feat____________test______ Language_all_features.txt
         |______train_____ Language_all_features.txt

    feat is the folder where the features are stored. The code will automatically create this folder. It will also create the test and train

train

trained_model____Language.pkl

    trained_model is the folder where the trained model is stored. The code will automatically create this folder. For each language a separate language.pkl file will be created.



    All of the above files are refreshed every time the code is run. No need to place any files in the above folders.
