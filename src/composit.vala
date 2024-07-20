// Compositing Step
// Combine outputs of linework, colorwork, snuff to produce final image
//
// (C) 2024 Daren Scot Wilson 





public struct CompositingParams {
    float linework_black_level;       // value of darkest parts of linework 
    float snuff_leakage;             // 0.0 = snuff to pure white,  1.0 = no color snuffing
}


