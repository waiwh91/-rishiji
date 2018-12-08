import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    
    static let shared = CoreDataManager()
    
    // 拿到AppDelegate中创建好了的NSManagedObjectContext
    lazy var context: NSManagedObjectContext = {
        let context = ((UIApplication.shared.delegate) as! AppDelegate).context
        return context
    }()
    
    // 更新数据
    private func saveContext() {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    // 增加数据
    func saveTextWith(text: String,date:Date) {
        let texts = NSEntityDescription.insertNewObject(forEntityName: "Texts", into: context) as! Texts
        texts.text = text
        texts.date = date
        saveContext()
    }
    
    // 根据姓名获取数据
    func getTextWith(date: Date) -> [Texts] {
        let fetchRequest: NSFetchRequest = Texts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", date as CVarArg)
        do {
            let result: [Texts] = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    
    // 获取所有数据
    func getAllText() -> [Texts] {
        let fetchRequest: NSFetchRequest = Texts.fetchRequest()
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    
    // 根据时间修改数据
    func changePersonWith(date: Date, newtext: String, newdate: Date) {
        let fetchRequest: NSFetchRequest = Texts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", date as CVarArg)
        do {
            let result = try context.fetch(fetchRequest)
            for texts in result {
                texts.text = newtext
                texts.date = newdate
            }
        } catch {
            fatalError();
        }
        saveContext()
    }
    
    // 根据时间删除数据
    func deleteWith(date: Date) {
        let fetchRequest: NSFetchRequest = Texts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", date as CVarArg)
        do {
            let result = try context.fetch(fetchRequest)
            for texts in result {
                context.delete(texts)
            }
        } catch {
            fatalError();
        }
        saveContext()
    }
    
    // 删除所有数据
    func deleteAllPerson() {
        let result = getAllText()
        for texts in result {
            context.delete(texts)
        }
        saveContext()
    }
}

