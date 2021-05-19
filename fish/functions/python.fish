function python --description 'Use system python3 outside of conda'
    if set -q CONDA_PREFIX
        command python
    else
        command python3
    end
end
