//
//  CoreDataManager.swift
//  MyToDoApp
//
//  Created by Allen H on 2022/04/21.
//

import UIKit
import CoreData

//MARK: - To do 관리하는 매니저 (코어데이터 관리)

final class CoreDataManager {
    
    // 싱글톤으로 만들기
    static let shared = CoreDataManager()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 영구 컨테이너 내의 임시저장소 (옵셔널 타입)
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔터티 이름 (코어데이터에 저장된 객체)
    let modelName: String = "MemoData"
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getToDoListFromCoreData() -> [MemoData] {
        var toDoList: [MemoData] = []
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 정렬순서를 정해서 요청서에 넘겨주기 (true: 오름차순 / false: 내림차순)
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                // 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    toDoList = fetchedToDoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        
        return toDoList
    }
    
    // MARK: - [Create] 코어데이터에 데이터 생성하기
    func saveToDoData(toDoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
        // 임시저장소 있는지 확인
        if let context = context {
            
            /*
             비동기 처리가 필요한 경우 (데이터 저장 시간이 오래 걸리는 작업인 경우)
             
             context.perform {      // 비동기적으로 처리됨
                if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                                    ...
                }
             }
             */
            context.perform {
                
            }
            
            // 임시저장소에 있는 데이터를 그려줄 형태 파악하기
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                
                // 임시저장소에 올라가게 할 객체만들기 (NSManagedObject ===> MemoData)
                if let MemoData = NSManagedObject(entity: entity, insertInto: context) as? MemoData {
                    
                    // MemoData에 실제 데이터 할당 ⭐️
                    MemoData.text = toDoText
                    MemoData.date = Date()   // 날짜는 저장하는 순간의 날짜로 생성
                    MemoData.color = colorInt
                    
                    // 임시 저장소의 내용을 (변화가 있다면)저장
                    
                    // Case 1. AppDelegate의 메서드로 호출
                    //appDelegate?.saveContext()
                    
                    // Case 2. 메서드 직접 구현
                    if context.hasChanges {
                        do {
                            try context.save()
                            // 비동기처리를 할 경우 콜백함수 호출
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 ===> 삭제)
    func deleteToDo(data: MemoData, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        // 이후 작업에서, 삭제할 데이터의 특정 속성값으로(현재 date 값) 데이터가 영구 저장소에 있는지 찾기 위해
        // 삭제하려는 data에 date값이 있는지 확인
        guard let date = data.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // predicate = 단서 / 찾기 위한 조건 설정 ("date = %@" -> date 속성을 기준으로 가져옴)
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    
                    // 임시저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete메서드)
                    // 동일한 날짜를 가진 데이터가 하나밖에 없을 것이기 때문에(초단위까지 보기 때문) first 메서드로 삭제할 데이터 선택
                    // 만약 조건에 일치하는 데이터가 여러개 있을 시 이후 추가 과정 필요
                    if let targetToDo = fetchedToDoList.first {
                        context.delete(targetToDo)
                        
                        // 임시 저장소의 내용을 (변화가 있다면)저장
                        
                        // Case 1. AppDelegate의 메서드로 호출
                        //appDelegate?.saveContext()
                        
                        // Case 2. 메서드 직접 구현
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    func updateToDo(newToDoData: MemoData, completion: @escaping () -> Void) {
        // 현재 메모앱에서 date(생성한 날짜)값은 변하지 않도록 구성했기 때문에
        // 이후 작업에서, 수정하기 위한 새로운 데이터의 date 값으로 수정할 데이터를 영구 저장소에 있는지 찾기 위해
        // 수정하기 위한 새로운 data에 date값이 있는지 확인
        guard let date = newToDoData.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    // 배열의 첫번째
                    if var targetToDo = fetchedToDoList.first {
                        
                        // MemoData에 실제 데이터 재할당(바꾸기) ⭐️
                        targetToDo = newToDoData
                        
                        // 임시 저장소의 내용을 (변화가 있다면)저장
                        
                        // Case 1. AppDelegate의 메서드로 호출
                        //appDelegate?.saveContext()
                        
                        // Case 2. 메서드 직접 구현
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
}
