k= menu ('Image Tool Box' , 'Image Conversion','Image Algebra','Point Operations','Neighborhood Operations','Histogram','Image Translation','Image Rotation','Frequency Domain','Exit');
while k ~= 9
    switch k
        case 1
            i= menu ('Image Conversion' , 'RGB To Gray','Gray To RGB','Gray To Binary','Index To RGB','Index To Gray','Back');

            while i~=6
                switch i
                    case 1


                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);

                        newimge = RGB2Gray(oldimge);

                    case 2
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        newimge = Gray2RGB(oldimge);

                    case 3
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        threshould= str2double(getfield((inputdlg('Please enter the threshould value','Input Dialog')),{1}));
                        newimge = Gray2Binary(oldimge,threshould);

                    case 4
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        [oldimge map] = imread([pathname filename]);
                        newimge = Ind2RGB(oldimge,map);

                    case 5
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        [oldimge map] = imread([pathname filename]);

                        newimge = Ind2Gray(oldimge,map);


                end
                i= menu ('Image Conversion' , 'RGB To Gray','Gray To RGB','Gray To Binary','Index To RGB','Index To Gray','Back');
            end



        case 2

            i= menu ('Image Algebra' , 'Images Addition','Images Subtraction','Images Multiplication','Back');

            while i~=4
                switch i
                    case 1
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select Image 1');

                        oldimg1 = imread([pathname filename]);
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select Image 2');

                        oldimg2 = imread([pathname filename]);
                        newimg = Add(oldimg1,oldimg2);

                    case 2
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select Image 1');

                        oldimg1 = imread([pathname filename]);
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select Image 2');

                        oldimg2 = imread([pathname filename]);
                        newimg = Subtract(oldimg1,oldimg2);

                    case 3
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select Image 1');

                        oldimg1 = imread([pathname filename]);
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select Image 2');

                        oldimg2 = imread([pathname filename]);
                        newimg = Multiplication(oldimg1,oldimg2);




                end
                i= menu ('Image Algebra' , 'Images Addition','Images Subtraction','Images Multiplication','Back');
            end




        case 3

            i= menu ('Point Operations' , 'Brightness','Contrast','Gamma Correction','Negative','Back');

            while i~=5
                switch i
                    case 1
                        [ filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimg = imread([pathname filename]);




                        offset = str2double(getfield((inputdlg('Please enter the offset value','Input Dialog')),{1}));
                        newimg = Brightness(oldimg,offset);

                    case 2
                        [ filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimg = imread([pathname filename]);
                        NewMin= str2double(getfield((inputdlg('Please enter the NewMin value','Input Dialog')),{1}));
                        NewMax= str2double(getfield((inputdlg('Please enter the NewMax value','Input Dialog')),{1}));
                        newimg = Contrast(oldimg,NewMin,NewMax);

                    case 3
                        [ filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimg = imread([pathname filename]);
                        gamma= str2double(getfield((inputdlg('Please enter the Gamma value','Input Dialog')),{1}));
                        newimg = GammaCorrection(oldimg,gamma);


                    case 4
                        [ filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimg = imread([pathname filename]);
                        newimg = Negative(oldimg);





                end
                i= menu ('Point Operations' , 'Brightness','Contrast','Gamma Correction','Negative','Back');
            end




        case 4

            i= menu ('Neighborhood Operations' , 'Bluring','Detection','Sharpening','Back');

            while i~=4

                switch i

                    case 1

                        j= menu ('Bluring Filters' , 'Bluring Mean Filter','Bluring Weight Filter','Bluring Dynamic Filter','Back');

                        while j~=4

                            switch j

                                case 1
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                   maskW= str2double(getfield((inputdlg('Please enter the Mask Width','Input Dialog')),{1}));
                                    newimg = MeanFilter(oldimg,maskW);

                                case 2
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = WeightFilter(oldimg);

                                case 3
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    mask= str2double(getfield((inputdlg('Please enter the Mask','Input Dialog')),{1}));
                                    newimg = DynamicFilter(oldimg,mask);

                            end
                            j= menu ('Bluring Filters' , 'Bluring Mean Filter','Bluring Weight Filter','Bluring Dynamic Filter','Back');
                        end


                    case 2

                        j= menu ('Detection Filters' , 'Point Detection','Vertical Detection','Horizontal Detection','Diagnoal left Detection','Diagonal right Detection','Back');

                        while j~=6

                            switch j

                                case 1
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = PointDetection(oldimg);

                                case 2
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = VerticalDetection(oldimg);

                                case 3
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = HorizontalDetection(oldimg);

                                case 4
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = DiagonalLeftDetection(oldimg);

                                case 5
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = DiagonalRightDetection(oldimg);

                            end
                            j= menu ('Detection Filters' , 'Point Detection','Vertical Detection','Horizontal Detection','Diagnoal left Detection','Diagonal right Detection','Back');
                        end

                    case 3


                        j= menu ('Sharpening Filters' , 'Point Sharpening','Vertical Sharpening','Horizontal Sharpening','Diagnoal left Sharpening','Diagonal right Sharpening','Back');

                        while j~=6

                            switch j

                                case 1
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = PointSharpening(oldimg);

                                case 2
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = VerticalSharpening(oldimg);

                                case 3
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = HorizontalSharpening(oldimg);

                                case 4
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = DiagonalLeftSharpening(oldimg);

                                case 5
                                    [ filename, pathname] = uigetfile( ...
                                        {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                                        '*.*',  'All Files (*.*)'}, ...
                                        'Select an Image');

                                    oldimg = imread([pathname filename]);
                                    newimg = DiagonalRightSharpening(oldimg);

                            end
                            j= menu ('Detection Filters' , 'Point Sharpening','Vertical Sharpening','Horizontal Sharpening','Diagnoal left Sharpening','Diagonal right Sharpening','Back');
                        end




                end
                i= menu ('Neighborhood Operations' , 'Bluring','Detection','Sharpening','Back');
            end



        case 5

            i= menu ('Histogram' , 'Image Histogram','Histogram Equalization','Back');

            while i~=3
                switch i
                    case 1
                        [ filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimg = imread([pathname filename]);
                        newimg = Histogram(oldimg);

                    case 2
                        [ filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimg = imread([pathname filename]);
                        newimg = HistogramEqulaization(oldimg);




                end
                i= menu ('Histogram' , 'Image Histogram','Histogram Equalization','Back');
            end

        case 6
            [ filename, pathname] = uigetfile( ...
                {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                '*.*',  'All Files (*.*)'}, ...
                'Select an Image');

            oldimg = imread([pathname filename]);
            TransX= str2double(getfield((inputdlg('Please enter the TransX value','Input Dialog')),{1}));
            TransY= str2double(getfield((inputdlg('Please enter the TransY value','Input Dialog')),{1}));
            newimg = Translation(oldimg,TransX,TransY);


        case 7
            [ filename, pathname] = uigetfile( ...
                {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                '*.*',  'All Files (*.*)'}, ...
                'Select an Image');

            oldimg = imread([pathname filename]);
            angle= str2double(getfield((inputdlg('Please enter the Rotation Angle value','Input Dialog')),{1}));

            newimg = Rotation(oldimg,angle);

        case 8
            i= menu ('Frequency Domain' , 'Ideal Lowpass Filter','Ideal Highpass Filter','Butterworth Lowpass Filter','Butterworth Highpass Filter','Gaussian Lowpass Filter','Gaussian Highpass Filte','Back');

            while i~=7
                switch i
                    case 1


                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        d= str2double(getfield((inputdlg('Please enter the diastance value','Input Dialog')),{1}));

                        newimge = FourierIdealLowPassFilter(oldimge,d);


                    case 2
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        d= str2double(getfield((inputdlg('Please enter the diastance value','Input Dialog')),{1}));

                        newimge = FourierIdealHighPassFilter(oldimge,d);

                    case 3

                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        d= str2double(getfield((inputdlg('Please enter the diastance value','Input Dialog')),{1}));
                        n= str2double(getfield((inputdlg('Please enter the order of filter ','Input Dialog')),{1}));
                        newimge = FourierButterworthLowpassFilter(oldimge,d,n);


                    case 4


                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        d= str2double(getfield((inputdlg('Please enter the diastance value','Input Dialog')),{1}));
                        n= str2double(getfield((inputdlg('Please enter the order of filter ','Input Dialog')),{1}));
                        newimge = FourierButterworthHighpassFilter(oldimge,d,n);


                    case 5

                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        d= str2double(getfield((inputdlg('Please enter the diastance value','Input Dialog')),{1}));

                        newimge = FourierGaussianLowpassFilter(oldimge,d);


                    case 6
                        [filename, pathname] = uigetfile( ...
                            {'*.tif;*.png;*.jpeg;*.jpg','Image Files (*.tif,*.png,*.jpeg,*.jpg)';
                            '*.*',  'All Files (*.*)'}, ...
                            'Select an Image');

                        oldimge = imread([pathname filename]);
                        d= str2double(getfield((inputdlg('Please enter the diastance value','Input Dialog')),{1}));

                        newimge = FourierGaussianHighpassFilter(oldimge,d);



                end

                i= menu ('Frequency Domain' , 'Ideal Lowpass Filter','Ideal Highpass Filter','Butterworth Lowpass Filter','Butterworth Highpass Filter','Gaussian Lowpass Filter','Gaussian Highpass Filte','Back');


            end
    end
    
            k= menu ('Image Tool Box' , 'Image Conversion','Image Algebra','Point Operations','Neighborhood Operations','Histogram','Image Translation','Image Rotation','Frequency Domain','Exit');

    end