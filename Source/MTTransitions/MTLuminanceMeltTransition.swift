//
//  MTLuminance_meltTransition.swift
//  MTTransitions
//
//  Created by alexiscn on 2019/1/28.
//

public class MTLuminance_meltTransition: MTTransition {
    
    /// direction of movement :  0 : up, 1, down
    public var direction: Bool = true

    /// does the movement takes effect above or below luminance threshold ?
    public var above: Bool = false 

    /// luminance threshold
    public var l_threshold: Float = 0.8 

    override var fragmentName: String {
        return "LuminanceMeltFragment"
    }
}
