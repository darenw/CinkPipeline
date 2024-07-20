// Prep Step
// Pre-processing to make the artify process more interesting.
// 1. scale up, typically 2x or 4x, using const or linear interpolation
// 2. add subtle noise
// 3. tweak saturation curve to make most area strongly colored or lightly colored, less midrange
// 4. maybe some other pixel tweaking
//
// (C) 2024 Daren Scot Wilson 





public struct PrepParams {
    int magfactor;
}


