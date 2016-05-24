//
//  DynamicItem+Physical.swift
//  StellarDemo
//
//  Created by AugustRush on 5/17/16.
//  Copyright © 2016 August. All rights reserved.
//
import UIKit

extension Float: Physical, Vectorial, Interpolatable, Animatable {
    
    func fallTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: Float,render: (Float) -> Void) {
        let item = DynamicItem<Float>(from: self,to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        push.commit()
    }
    
    func animationTo(to: Float, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (Float) -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: Float, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (Float) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: Float, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (Float) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        push.commit()
    }
    //Vetorial
    func convert(p: CGPoint) -> Float {
        return Float(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, CGFloat(self))
    }
    
    //Interpolatable
    
    func interpolate(progress: Double, to: Float, externalData: Any?) -> Float {
        let change = to - self
        return self + change * Float(progress)
    }
}

extension Double: Physical, Vectorial, Interpolatable, Animatable {
    
    func fallTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self, to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: Double,render: (Double) -> Void) {
        let item = DynamicItem<Double>(from: self,to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        item.boundaryLimit = true
        push.commit()
    }
    
    func animationTo(to: Double, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (Double) -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: Double, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (Double) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: Double, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (Double) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        basicItem.autoReverse = autoReverse
        basicItem.repeatCount = repeatCount
        push.commit()
    }
    
    //
    func convert(p: CGPoint) -> Double {
        return Double(p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, CGFloat(self))
    }
    
    //Interpolatable
    
    func interpolate(progress: Double, to: Double, externalData: Any?) -> Double {
        let change = to - self
        return self + change * progress
    }

}

extension CGFloat: Physical , Vectorial, Interpolatable, Animatable {
    
    func fallTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to,render: render)
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGFloat,render: (CGFloat) -> Void) {
        let item = DynamicItem<CGFloat>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: CGFloat, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (CGFloat) -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: CGFloat, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (CGFloat) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: CGFloat, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (CGFloat) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        basicItem.autoReverse = autoReverse
        basicItem.repeatCount = repeatCount
        push.commit()
    }
    
    //
    func convert(p: CGPoint) -> CGFloat {
        return p.y
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(0, self)
    }
    
    //Interpolatable
    
    func interpolate(progress: Double, to: CGFloat, externalData: Any?) -> CGFloat {
        let change = to - self
        return self + change * CGFloat(progress)
    }
    
}

extension CGSize: Physical, Vectorial, Interpolatable, Animatable {
    
    func fallTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGSize,render: (CGSize) -> Void) {
        let item = DynamicItem<CGSize>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: CGSize, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (CGSize) -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: CGSize, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (CGSize) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: CGSize, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (CGSize) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        basicItem.autoReverse = autoReverse
        basicItem.repeatCount = repeatCount
        push.commit()
    }
    
    //
    func convert(p: CGPoint) -> CGSize {
        return CGSizeMake(p.x, p.y)
    }
    
    func reverse() -> CGPoint {
        return CGPointMake(self.width, self.height)
    }
    
    //
    func interpolate(progress: Double, to: CGSize, externalData: Any?) -> CGSize {
        let wChnaged = to.width - self.width;
        let hChanged = to.height - self.height;
        let currentW = self.width + wChnaged * CGFloat(progress);
        let currentH = self.height + hChanged * CGFloat(progress);
        return CGSizeMake(currentW, currentH)
    }
}

extension CGPoint: Physical, Vectorial, Interpolatable, Animatable {
    
    func fallTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let gravity = item.gravityBehavior(1, direction: direction)
        item.behavior = gravity
        gravity.commit()
    }
    
    func snapTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to, render: render)
        let snap = item.snapBehavior(item.toP, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self, to: to,render: render)
        let attachment = item.attachmentBehavior(item.toP, length: 0.0, damping: 0.5, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGPoint,render: (CGPoint) -> Void) {
        let item = DynamicItem<CGPoint>(from: self,to: to,render: render)
        item.boundaryLimit = true
        let direction = CGVectorMake(item.toP.x - item.fromP.x, item.toP.y - item.fromP.y)
        let push = item.pushBehavior(direction, mode: .Instantaneous, magnitude: 1.0)
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: CGPoint, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (CGPoint) -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: CGPoint, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (CGPoint) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: CGPoint, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (CGPoint) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        basicItem.autoReverse = autoReverse
        basicItem.repeatCount = repeatCount
        push.commit()
    }
    
    //
    func convert(p: CGPoint) -> CGPoint {
        return p
    }
    
    func reverse() -> CGPoint {
        return self
    }
    
    func interpolate(progress: Double, to: CGPoint, externalData: Any?) -> CGPoint {
        let xChnaged = to.x - self.x;
        let yChanged = to.y - self.y;
        let currentX = self.x + xChnaged * CGFloat(progress);
        let currentY = self.y + yChanged * CGFloat(progress);
        return CGPointMake(currentX, currentY)
    }
}

extension CGRect: Physical, Vectorial2, Interpolatable, Animatable {
    
    func fallTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render: render)
        let gravity = item.gravityBehavior(1,direction: .Down)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let snap = item.snapBehavior(CGPointMake(0.0, item.referenceChangeLength), damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: 0.8, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: CGRect, render: (CGRect) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let push = item.pushBehavior(.Down)
        push.magnitude = 2.0
        item.boundaryLimit = true
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: CGRect, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (CGRect) -> Void, completion: ((Bool) -> Void)? = nil) {
       self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: CGRect, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (CGRect) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: CGRect, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (CGRect) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        basicItem.autoReverse = autoReverse
        basicItem.repeatCount = repeatCount
        push.commit()
    }
    
    //
    func convert(r: CGRect) -> CGRect {
        return r
    }
    
    func reverse() -> CGRect {
        return self
    }
    
    //
    func interpolate(progress: Double, to: CGRect, externalData: Any?) -> CGRect {
        let xChanged = to.minX - self.minX
        let yChanged = to.minY - self.minY
        let wChnaged = to.width - self.width;
        let hChanged = to.height - self.height;
        let currentX = self.minX + xChanged * CGFloat(progress)
        let currentY = self.minY + yChanged * CGFloat(progress)
        let currentW = self.width + wChnaged * CGFloat(progress)
        let currentH = self.height + hChanged * CGFloat(progress)
        
        return CGRectMake(currentX, currentY, currentW, currentH)
    }
}

extension UIColor: Physical, Vectorial2, Interpolatable, Animatable {
    
    func fallTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render: render)
        let gravity = item.gravityBehavior(1,direction: .Down)
        item.behavior = gravity
        item.boundaryLimit = true
        gravity.commit()
    }
    
    func snapTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let snap = item.snapBehavior(point, damping: 0.5)
        item.behavior = snap
        snap.commit()
    }
    
    func attachmentTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let point = CGPointMake(0.0, item.referenceChangeLength)
        let attachment = item.attachmentBehavior(point, length: 0.0, damping: 0.8, frequency: 1)
        item.behavior = attachment
        attachment.commit()
    }
    
    func pushedTo(to: UIColor, render: (UIColor) -> Void) {
        let item = DynamicItem2(from: self, to: to, render:render)
        let push = item.pushBehavior(.Down)
        push.magnitude = 2.0
        item.boundaryLimit = true
        item.behavior = push
        push.commit()
    }
    
    func animationTo(to: UIColor, duration: CFTimeInterval = 0.25, type: TimingFunctionType = .Default, render: (UIColor) -> Void, completion: ((Bool) -> Void)? = nil) {
        self.animationTo(to, duration: duration, type: type, autoReverse: false, render: render, completion: completion)
    }
    
    func animationTo(to: UIColor, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, render: (UIColor) -> Void, completion: ((Bool) -> Void)?) {
        self.animationTo(to, duration: duration, type: type, autoReverse: autoReverse, repeatCount: 0, render: render, completion: completion)
    }
    
    func animationTo(to: UIColor, duration: CFTimeInterval, type: TimingFunctionType, autoReverse: Bool, repeatCount: Int, render: (UIColor) -> Void, completion: ((Bool) -> Void)?) {
        let basicItem = DynamicItemBasic(from: self, to: to, render: render)
        let push = basicItem.pushBehavior(.Down)
        basicItem.behavior = push
        basicItem.duration = duration
        basicItem.timingFunction = type.timingFunction()
        basicItem.completion = completion
        basicItem.autoReverse = autoReverse
        basicItem.repeatCount = repeatCount
        let fromInfo = self.colorInfo()
        let toInfo = to.colorInfo()
        basicItem.externalData = (fromInfo,toInfo)
        push.commit()
    }
    
    //
    func convert(r: CGRect) -> Self {
        let hue = r.minX / 250.0
        let saturation = r.minY / 250.0
        let brightness = r.width / 250.0
        let alpha = r.height / 250.0
        return convertT(hue,saturation: saturation,brightness: brightness,alpha: alpha)
    }
    
    func reverse() -> CGRect {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        hue *= 250.0
        saturation *= 250.0
        brightness *= 250.0
        alpha *= 250.0
        return CGRect(x: hue, y: saturation, width: brightness, height: alpha)
    }
    
    private func convertT<T>(hue: CGFloat,saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> T {
        let color = UIColor(hue: hue,saturation: saturation,brightness: brightness,alpha: alpha)
        return color as! T
    }
    
    //
    func interpolate(progress: Double, to: UIColor, externalData: Any?) -> Self {        
        let infos = externalData as! (ColorInfo,ColorInfo)
        let fromInfo = infos.0
        let toInfo = infos.1
        let changedHue =  toInfo.hue - fromInfo.hue
        let changedSaturation = toInfo.saturation - fromInfo.saturation
        let changedBrightness = toInfo.brightness - fromInfo.brightness
        let changedAlpha = toInfo.alpha - fromInfo.alpha
    
        let curHue = fromInfo.hue + changedHue * CGFloat(progress)
        let curSaturation = fromInfo.saturation + changedSaturation * CGFloat(progress)
        let curBrightness = fromInfo.brightness + changedBrightness * CGFloat(progress)
        let curAlpha = fromInfo.alpha + changedAlpha * CGFloat(progress)
        
        return convertT(curHue,saturation: curSaturation,brightness: curBrightness,alpha: curAlpha)
    }
    
    //performance
    typealias ColorInfo = (hue:CGFloat,saturation:CGFloat,brightness:CGFloat,alpha:CGFloat)
    private func colorInfo() -> ColorInfo {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return (hue,saturation,brightness,alpha)
    }
    
}