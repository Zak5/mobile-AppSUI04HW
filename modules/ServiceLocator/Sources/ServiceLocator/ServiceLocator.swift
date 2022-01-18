//
//  ServiceLocator.swift
//
//
//  Created by Konstantin Zaharev on 28.12.2021.
//

public class ServiceLocator {
    public static let shared = ServiceLocator()
    
    public lazy var services: [String: AnyObject] = {
        return [String:AnyObject]()
    }()
    
    public func addService<T:AnyObject>(_ service: T) {
        let key = String(describing: T.self)
        if services[key] == nil {
            services[key] = service
        }
    }
    
    public func resolve<T:AnyObject>(type: T.Type)->T? {
        let key = String(describing: type)
        return services[key] as? T
    }
}
