//
//  JobQueue.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-04-17.
//

import Foundation


class JobQueue {
    
    let jobs:[()->()]
    private var group: DispatchGroup
    var complitionHandler: (_ result: Result<Any, Error>)->()
    private var startTime: Date?
    
    init(jobs: [()->()]){
        self.group = DispatchGroup()
        self.jobs = jobs
        for _ in self.jobs{
            self.group.enter()
        }
        complitionHandler = {_ in  }
        configureNotify()
    }
    
    private func configureNotify(){
        self.group.notify(queue: .main){
            if let _startTime = self.startTime{
                let workTime = Date().timeIntervalSince1970 - _startTime.timeIntervalSince1970
                self.complitionHandler( .success(workTime))
            }else{
                self.complitionHandler( .failure(JobQueueError.badTimeStart) )
            }
        }
    }
    
    
    func run( complitionHandler: @escaping (_ result: Result<Any, Error>)->()){
        self.complitionHandler = complitionHandler
        startTime = Date()
         
        for job  in jobs {
            DispatchQueue.global(qos: .userInitiated).async{
                job()
                self.group.leave()
            }
        }
    }
}
