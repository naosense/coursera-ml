function savePlot(path)
    overwrite = false;
    if (!overwrite & exist(path, 'file'))
        return;
    end
    
    PRINT_TO_FILE = true;
    if (PRINT_TO_FILE) 
        print('-dpng', path, '-r72');
    end
end

