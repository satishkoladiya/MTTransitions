//
//  MTCircleopenTransition.swift
//  MTTransitions
//
//  Created by alexiscn on 2019/1/28.
//

public class MTCircleopenTransition: MTTransition {
    
    public var smoothness: Float = 0.3 

    public var opening: Bool = true 

    override var fragmentName: String {
        return "CircleopenFragment"
    }
}
