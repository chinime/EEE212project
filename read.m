function fn = read()
    load clicked.mat;
    if strcmpi(clicked, 'File')
        load filename.mat;
        load pathname.mat;
        
        fn = fullfile(pathname, filename);
    else
        fn = 'textbox.txt';
    end
end

