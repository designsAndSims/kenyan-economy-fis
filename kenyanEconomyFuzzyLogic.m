function kenyanEconomyFuzzyLogic
    %% Create FIS with Gaussian Membership Functions
    fis = mamfis('Name', 'KenyanEconomyCrisis');
    
    % Define Input 1: Risk of Default with Gaussian MFs
    fis = addInput(fis, [0 100], 'Name', 'DefaultRisk');
    fis = addMF(fis, 'DefaultRisk', 'gaussmf', [10, 20], 'Name', 'Low');      % sigma=10, mean=20
    fis = addMF(fis, 'DefaultRisk', 'gaussmf', [15, 50], 'Name', 'Medium');   % sigma=15, mean=50
    fis = addMF(fis, 'DefaultRisk', 'gaussmf', [10, 80], 'Name', 'High');     % sigma=10, mean=80
    
    % Define Input 2: Economic Growth with Gaussian MFs
    fis = addInput(fis, [0 100], 'Name', 'EconGrowth');
    fis = addMF(fis, 'EconGrowth', 'gaussmf', [10, 30], 'Name', 'Low');       % sigma=10, mean=30
    fis = addMF(fis, 'EconGrowth', 'gaussmf', [10, 50], 'Name', 'Medium');    % sigma=10, mean=50
    fis = addMF(fis, 'EconGrowth', 'gaussmf', [10, 70], 'Name', 'High');      % sigma=10, mean=70
    
    % Define Output: Crisis Risk with Gaussian MFs
    fis = addOutput(fis, [0 100], 'Name', 'CrisisRisk');
    fis = addMF(fis, 'CrisisRisk', 'gaussmf', [10, 30], 'Name', 'Low');       % sigma=10, mean=30
    fis = addMF(fis, 'CrisisRisk', 'gaussmf', [10, 50], 'Name', 'Medium');    % sigma=10, mean=50
    fis = addMF(fis, 'CrisisRisk', 'gaussmf', [10, 80], 'Name', 'High');      % sigma=10, mean=80
    
    % Define Rule Base (Expert Rules)
    rules = [
        "DefaultRisk==High & EconGrowth==Low => CrisisRisk=High (1)"
        "DefaultRisk==High & EconGrowth==Medium => CrisisRisk=High (1)"
        "DefaultRisk==High & EconGrowth==High => CrisisRisk=Medium (1)"
        "DefaultRisk==Medium & EconGrowth==Low => CrisisRisk=High (1)"
        "DefaultRisk==Medium & EconGrowth==Medium => CrisisRisk=Medium (1)"
        "DefaultRisk==Medium & EconGrowth==High => CrisisRisk=Low (1)"
        "DefaultRisk==Low & EconGrowth==Low => CrisisRisk=Medium (1)"
        "DefaultRisk==Low & EconGrowth==Medium => CrisisRisk=Low (1)"
        "DefaultRisk==Low & EconGrowth==High => CrisisRisk=Low (1)"
    ];
    fis = addRule(fis, rules);
    
    %% Create UI
    fig = uifigure('Name', 'Kenyan Economy Crisis FIS', 'Position', [100 100 900 600]);
    
    % Control Panel for Input Sliders
    ctrlPanel = uipanel(fig, 'Title', 'Risk Factors Control', ...
        'Position', [20 320 280 255], 'BackgroundColor', [0.95 0.95 0.95]);
    
    % Slider for Default Risk
    uilabel(ctrlPanel, 'Position', [10 200 260 22], 'Text', 'Risk of Default (%)', ...
        'FontWeight', 'bold', 'FontSize', 13);
    sliderDef = uislider(ctrlPanel, 'Position', [10 170 260 3], 'Limits', [0 100], ...
        'Value', 50, 'MajorTicks', 0:20:100, 'MinorTicks', 0:10:100);
    lblDefVal = uilabel(ctrlPanel, 'Position', [10 130 260 22], 'Text', '50%', ...
        'HorizontalAlignment', 'center', 'FontSize', 12);
    
    % Slider for Economic Growth
    uilabel(ctrlPanel, 'Position', [10 90 260 22], 'Text', 'Economic Growth (%)', ...
        'FontWeight', 'bold', 'FontSize', 13);
    sliderEcon = uislider(ctrlPanel, 'Position', [10 60 260 3], 'Limits', [0 100], ...
        'Value', 50, 'MajorTicks', 0:20:100, 'MinorTicks', 0:10:100);
    lblEconVal = uilabel(ctrlPanel, 'Position', [10 20 260 22], 'Text', '50%', ...
        'HorizontalAlignment', 'center', 'FontSize', 12);
    
    % Output Panel for Crisis Risk Result
    outPanel = uipanel(fig, 'Title', 'Crisis Risk Assessment', ...
        'Position', [20 200 280 100], 'BackgroundColor', [0.95 0.95 0.95]);
    lblOutput = uilabel(outPanel, 'Position', [10 40 260 30], 'Text', 'Crisis Risk: 50%', ...
        'FontSize', 16, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
    lblRiskLevel = uilabel(outPanel, 'Position', [10 10 260 30], 'Text', 'Risk Level: Medium', ...
        'FontSize', 14, 'HorizontalAlignment', 'center');
    
    % Panel for Membership Function Plots
    mfPanel = uipanel(fig, 'Title', 'Input Membership Functions', ...
        'Position', [20 50 280 140], 'BackgroundColor', [0.95 0.95 0.95]);
    axMF1 = uiaxes(mfPanel, 'Position', [10 80 260 50]);
    axMF2 = uiaxes(mfPanel, 'Position', [10 10 260 50]);
    
    % Plot Gaussian MFs for DefaultRisk
    x = linspace(0, 100, 1000);
    y_low = gaussmf(x, [10, 20]);
    y_med = gaussmf(x, [15, 50]);
    y_high = gaussmf(x, [10, 80]);
    plot(axMF1, x, y_low, 'b', x, y_med, 'g', x, y_high, 'r');
    title(axMF1, 'Default Risk MF (Gaussian)');
    xlabel(axMF1, 'Risk (%)'); ylabel(axMF1, 'Membership');
    legend(axMF1, {'Low', 'Medium', 'High'}, 'FontSize', 8, 'Location', 'northwest');
    axMF1.XLim = [0 100]; axMF1.YLim = [0 1.1];
    
    % Plot Gaussian MFs for EconGrowth
    y_low_econ = gaussmf(x, [10, 30]);
    y_med_econ = gaussmf(x, [10, 50]);
    y_high_econ = gaussmf(x, [10, 70]);
    plot(axMF2, x, y_low_econ, 'b', x, y_med_econ, 'g', x, y_high_econ, 'r');
    title(axMF2, 'Economic Growth MF (Gaussian)');
    xlabel(axMF2, 'Growth (%)'); ylabel(axMF2, 'Membership');
    legend(axMF2, {'Low', 'Medium', 'High'}, 'FontSize', 8, 'Location', 'northwest');
    axMF2.XLim = [0 100]; axMF2.YLim = [0 1.1];
    
    % Surface Plot Panel for FIS Output
    surfacePanel = uipanel(fig, 'Title', 'Risk Analysis Surface', ...
        'Position', [320 50 560 500]);
    axSurface = uiaxes(surfacePanel, 'Position', [10 10 540 480]);
    [xSurf, ySurf, zSurf] = gensurf(fis);
    hSurf = surf(axSurface, xSurf, ySurf, zSurf);
    colormap(axSurface, 'jet'); colorbar(axSurface);
    title(axSurface, 'Crisis Risk Analysis Surface');
    xlabel(axSurface, 'Default Risk (%)'); ylabel(axSurface, 'Economic Growth (%)');
    zlabel(axSurface, 'Crisis Risk (%)'); grid(axSurface, 'on');
    view(axSurface, 45, 30);
    
    % Marker for Current Input Values
    hold(axSurface, 'on');
    initDef = sliderDef.Value;
    initEcon = sliderEcon.Value;
    initOutput = evalfis(fis, [initDef, initEcon]);
    hMarker = plot3(axSurface, initDef, initEcon, initOutput, 'ro', ...
        'MarkerSize', 10, 'MarkerFaceColor', 'r');
    
    %% UI Update Function
    function updateUI()
        try
            defVal = sliderDef.Value;
            econVal = sliderEcon.Value;
            lblDefVal.Text = sprintf('%.1f%%', defVal);
            lblEconVal.Text = sprintf('%.1f%%', econVal);
            outputVal = evalfis(fis, [defVal, econVal]);
            lblOutput.Text = sprintf('Crisis Risk: %.1f%%', outputVal);
            if outputVal < 33.33
                riskText = 'Low'; lblRiskLevel.FontColor = [0 0.5 0];
            elseif outputVal < 66.67
                riskText = 'Medium'; lblRiskLevel.FontColor = [0.8 0.4 0];
            else
                riskText = 'High'; lblRiskLevel.FontColor = [0.8 0 0];
            end
            lblRiskLevel.Text = sprintf('Risk Level: %s', riskText);
            set(hMarker, 'XData', defVal, 'YData', econVal, 'ZData', outputVal);
            drawnow limitrate;
        catch ME
            warning('Error updating UI: %s', ME.message);
        end
    end
    
    % Set Callback Functions for Sliders
    sliderDef.ValueChangedFcn = @(src, event) updateUI();
    sliderEcon.ValueChangedFcn = @(src, event) updateUI();
    
    updateUI(); % Initial update
end
