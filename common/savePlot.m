function savePlot(path)
    PRINT_TO_FILE = true;
    if (PRINT_TO_FILE) 
        print('-dpng', path, '-r72');
    end
end

