import UIKit

final class ViewController: UIViewController {

    private let loginView = LoginView()

    override func loadView() {
        view = loginView
    }

    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

       setupAddTarget()
    }

    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }

    // MARK: - @objc resetButtonTapped()
    @objc func resetButtonTapped() {
        let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)

        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼 눌림")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소 버튼 눌림")
        }

        alert.addAction(success)
        alert.addAction(cancel)

        // 다음 화면으로 넘어가는 메서드
        present(alert, animated: true) {
            print("비밀번호 재설정 버튼 눌림")
        }
    }

    @objc func loginButtonTapped() {
        // 다음 화면으로 넘어가는 내용 구현 (present 사용 예정)
        print("로그인 버튼이 눌림")
    }
}
