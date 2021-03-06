//
// BlogAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class BlogAPI {

    /**

     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func blogsCountGet(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return blogsCountGetWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /blogs/count
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func blogsCountGetWithRequestBuilder() -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/blogs/count"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**

     - parameter id: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func blogsEventIdGet(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return blogsEventIdGetWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /blogs/event/{id}
     - Get all blogs linked to an event
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter id: (path)  
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func blogsEventIdGetWithRequestBuilder(id: String) -> RequestBuilder<AnyCodable> {
        var localVariablePath = "/blogs/event/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**

     - parameter limit: (query) Maximum number of results possible (optional)
     - parameter sort: (query) Sort according to a specific field. (optional)
     - parameter start: (query) Skip a specific number of entries (especially useful for pagination) (optional)
     - parameter : (query) Get entries that matches exactly your input (optional)
     - parameter ne: (query) Get records that are not equals to something (optional)
     - parameter lt: (query) Get record that are lower than a value (optional)
     - parameter lte: (query) Get records that are lower than or equal to a value (optional)
     - parameter gt: (query) Get records that are greater than a value (optional)
     - parameter gte: (query) Get records that are greater than  or equal a value (optional)
     - parameter contains: (query) Get records that contains a value (optional)
     - parameter containss: (query) Get records that contains (case sensitive) a value (optional)
     - parameter _in: (query) Get records that matches any value in the array of values (optional)
     - parameter nin: (query) Get records that doesn&#39;t match any value in the array of values (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func blogsGet(limit: Int? = nil, sort: String? = nil, start: Int? = nil, eq: String? = nil, ne: String? = nil, lt: String? = nil, lte: String? = nil, gt: String? = nil, gte: String? = nil, contains: String? = nil, containss: String? = nil, _in: [String]? = nil, nin: [String]? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Blog]?, _ error: Error?) -> Void)) -> RequestTask {
        return blogsGetWithRequestBuilder(limit: limit, sort: sort, start: start, eq: eq, ne: ne, lt: lt, lte: lte, gt: gt, gte: gte, contains: contains, containss: containss, _in: _in, nin: nin).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /blogs
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter limit: (query) Maximum number of results possible (optional)
     - parameter sort: (query) Sort according to a specific field. (optional)
     - parameter start: (query) Skip a specific number of entries (especially useful for pagination) (optional)
     - parameter : (query) Get entries that matches exactly your input (optional)
     - parameter ne: (query) Get records that are not equals to something (optional)
     - parameter lt: (query) Get record that are lower than a value (optional)
     - parameter lte: (query) Get records that are lower than or equal to a value (optional)
     - parameter gt: (query) Get records that are greater than a value (optional)
     - parameter gte: (query) Get records that are greater than  or equal a value (optional)
     - parameter contains: (query) Get records that contains a value (optional)
     - parameter containss: (query) Get records that contains (case sensitive) a value (optional)
     - parameter _in: (query) Get records that matches any value in the array of values (optional)
     - parameter nin: (query) Get records that doesn&#39;t match any value in the array of values (optional)
     - returns: RequestBuilder<[Blog]> 
     */
    open class func blogsGetWithRequestBuilder(limit: Int? = nil, sort: String? = nil, start: Int? = nil, eq: String? = nil, ne: String? = nil, lt: String? = nil, lte: String? = nil, gt: String? = nil, gte: String? = nil, contains: String? = nil, containss: String? = nil, _in: [String]? = nil, nin: [String]? = nil) -> RequestBuilder<[Blog]> {
        let localVariablePath = "/blogs"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "_limit": limit?.encodeToJSON(),
            "_sort": sort?.encodeToJSON(),
            "_start": start?.encodeToJSON(),
            "=": eq?.encodeToJSON(),
            "_ne": ne?.encodeToJSON(),
            "_lt": lt?.encodeToJSON(),
            "_lte": lte?.encodeToJSON(),
            "_gt": gt?.encodeToJSON(),
            "_gte": gte?.encodeToJSON(),
            "_contains": contains?.encodeToJSON(),
            "_containss": containss?.encodeToJSON(),
            "_in": _in?.encodeToJSON(),
            "_nin": nin?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Blog]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**

     - parameter id: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func blogsIdGet(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: Blog?, _ error: Error?) -> Void)) -> RequestTask {
        return blogsIdGetWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /blogs/{id}
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter id: (path)  
     - returns: RequestBuilder<Blog> 
     */
    open class func blogsIdGetWithRequestBuilder(id: String) -> RequestBuilder<Blog> {
        var localVariablePath = "/blogs/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Blog>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**

     - parameter id: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func blogsLaunchIdGet(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return blogsLaunchIdGetWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /blogs/launch/{id}
     - Get all blogs linked to a launch
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter id: (path)  
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func blogsLaunchIdGetWithRequestBuilder(id: String) -> RequestBuilder<AnyCodable> {
        var localVariablePath = "/blogs/launch/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
