import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var TeamOneCollectionView: UICollectionView!
    let teamOneList: [TeamOneList] = TeamOneList.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeamOneCollectionView.delegate = self
        TeamOneCollectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamOneList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = TeamOneCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamOneCollectionViewCell", for: indexPath) as? TeamOneCollectionViewCell else {
            return UICollectionViewCell()
        }
        let teamOne = teamOneList[indexPath.item]
        cell.configure(teamOne)

        return cell
    }
    // 개별적으로 제작한 스토리뷰를 모델에서 불러오기
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = teamOneList[indexPath.item]
        loadStoryboard(named: selectedItem.storyboardName, withID: selectedItem.viewControllerID)
    }
    
    private func loadStoryboard(named storyboardName: String, withID viewControllerID: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// 레이아웃 설정
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        let height = collectionView.bounds.height / 7
        return CGSize(width: width, height: height)
    }

}

// 헥사코드 쓰고싶어서
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
