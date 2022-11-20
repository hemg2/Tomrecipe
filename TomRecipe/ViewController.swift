//
//  ViewController.swift
//  TomRecipe
//
//  Created by 1 on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {

    let testLabel: BroadLabel = BroadLabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad() // 부모의 뷰디드로드를 실행시키고 이제 내가 재정의한걸 실행시키겠다
        view.addSubview(testLabel)
        testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.backgroundColor = .red
        testLabel.textAlignment = .center
        testLabel.text = "야야야야야야."
        button()
        
        
    }
    
    func button() {
        let testButton: BroadButton = BroadButton()
        testButton.setTitle("클릭", for: .normal)
        view.addSubview(testButton)
        testButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.backgroundColor = .systemBlue
        testButton.addAction(UIAction(handler: { [weak self] _ in // 클로저는 함수 a 외부의 것
//            self.testLabel.text = "asd"         이스케이핑 -> 셀프를쓴다
            guard let self = self else { return }
            self.a(label: self.testLabel) //탈출클로저 있어서 셀프를 써줘야한다. 안쓰면 컴파일 에러가 난다 그래서 셀프를써야한다
            // 셀프를 쓰면 순환참조가 발생된다 발생되면 메모리에 쌓이니깐 이걸 쌓이게되지않게 하기 위해
            //셀프를 쓰는곳은 순환참조가 발생하는곳 그래서 셀프를쓸때 weak self 를 쓰면 순환참조 발생을 방지한다.
            print("안녕하셉다!")
        }), for: .touchUpInside)
    }
    
    final func a(label: UILabel) {
        label.text = "func abcdefg"
    }
    

}


/*
 
 오버라이딩
 부모꺼 재정의
   오버로딩은 같은함수를 파라미터를 다르게하는것
 오버로딩은 함수를 중복선언할수있따

 Final은 상속불가능하게 하는거다(그클래스는 상속x)
 앱의 성능상능
 Final을안쓰면 상속이 될수있기때문에 가능성을 열어둔다.
 
 static과 class의 쓰임은 메소드와 프로퍼티를 인스턴스화 하지 않고 하나만 존재하도록 하기 위해 사용.
 -> 타입 메소드, 타입 프로퍼티가 됨, 차이는 static은 상속이 불가하다는점.
 
 
 
 
 클래스함수와 일반함수 차이
 
 Class func과 Static func 모두 타입 메소드 입니다.
 하지만 둘의 차이는 Override가 가능한가에 따라 다르다.
 Class func -> override 가능하다. staic func -> override 불가능하다.
 상속이후 super.func() //부모호출// 부모를 호출할경우 부모 자식 모두 호출된다.
 
 
 
 
 
 퍼블릭 프라이베이트
 Public -> 공개 접근 수전 // 모듈 외부에서도 접근가능
 Public 접근자 모듈이 아닌 다른 모듈에서 사용가능 Public 으로 선언된 것은 다른모듈에서는 오버라이드와 서브 클래싱이 불가능합니다.
 
 Private -> 비공개 접근 수준 // 정의한 블록 내부에서만 접근가능
 특정 엔티티가 선언된 괄호({})안에서만 사용 가능합니다.
 
 
 
 
 접근제어자 5개 //
 
 접근 제어란?
 -접근제어는 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간에 접근을 제한할 수 있는 기능입니다.
 -전체 코드가 노출될 가능성이 있을때 접근 제어를 이용한다.
 
 접근 수준
 - 접근제어는 접근수준 키워드를 통해 구현할 수 있다.
 - 접근수준을 명시할 수 있는 키워드는 open, public, internal, fileprivate, private 가 있다.
 
 open - 개방 접근 수준
 개방 접근수준은 공개 접근수준 이상으로 높은 접근수준이며, 클래스와 클래스의 멤버에서만 사용할 수 있다.
 개방 접근수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속할 수 있다.
 개방 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 밖의 다른 모듈에서도 재정의할 수 있다.
 상속을 받을수있다.
 
 
 public - 공개 접근수준
 public 키워드로 접근수준이 지정된 요소는 어디서든 쓰일 수 있다.
 공개 접근수준은 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 쓰인다.
 다른 모듈에서 사용가능 외부라이브러리 -> 퍼블릭만나온다 af. snp. 딱 여기까지 나온다 외부라이브러리 쓸때
 
 internal - 내부 접근수준
 내부 접근수준은 기본적으로 모든 요소에 암묵적으로 지정하는 기본 접근수준이다.
 내부 접근수준으로 지정된 요소는 소스파일이 속해 있는 모듈 어디에서든 쓰일 수 있다.
 하지만 그 모듈을 가져다 쓰는 외부 모듈에서는 접근할 수 없다.
 보통 외부에서 사용할 클래스나 구조체가 아니며, 모듈 내부에서 광역적으로 사용할 경우 내부 접근수준을 지정한다.
 internal은 기본 접근수준이므로 굳이 표기하지 않아도 된다.
 
 
 fileprivate - 파일외부비공개 접근수준 파일에서만 접근가능
 파일외부비공개 접근수준으로 지정된 요소는 그 요소가 구현된 소스파일 내부에서만 사용할 수 있다.
 해당 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길 수 있는 경우에 사용하면 좋다.
 
 private - 비공개 접근수준
 비공개 접근수준은 가장 한정적인 범위이다.
 비공개 접근수준으로 지정된 요소는 그 기능을 정의하고 구현한 범위 내에서만 사용할 수 있다.
 비공개 접근수준으로 지정한 기능은 같은 소스파일 안에 구현한 다른 타입이나 기능에서도 사용할 수 없다.
 성능상향 상속받을일이생기면 프라이베이트에서 인터벌로변경 파이널함수도 가능
 
 접근제어 구현 참고사항
 상위 요소보다 하위 요소가 더 높은 접근수준을 가질 수 없다.
 함수의 매개변수로 특정 접근수준이 부여된 타입이 전달되거나 반환한다면, 그 타입의 접근수준보다 함수의 접근수준이 높게 설정될 수 없다.
 프레임워크를 만들 때는 다른 모듈에서 특정 기능에 접근할 수 있도록 API로 사용할 기능을 공개 접근수준으로 지정해주어야 한다.
 열거형 내부의 각 case별로 따로 접근수준을 부여할 수 없고, 각 case의 접근수준은 열거형 자체의 접근수준을 따른다.
 
 
 
 
 
 클래스스테틱
 static은 override가 되지 않고!
 class는 override가 된다!
 
 
 
 
 
 Class - Reference type
 객체화 시 힙 메모리영역에 저장되며 ARC 로 객체의 메모리해제가 관리된다.
 대입 연산 시 레퍼런스가 복사되어 할당됨. (공유 가능)
 멀티스레딩 시 적절한 Lock 활용이 필요.
 상속 가능.
 Struct - Value type
 대입 연산 시 값 자체가 복제되어 할당됨(공유가 불가능).
 불변성(Immutable) 구현에 유리.
 멀티스레딩에 안전함.
 상속이 불가능. (protocol 은 사용 가능)


 차이점 제르시
 가장큰차이점 클래스-> 레퍼런스 타입 주소값만 복사
 스트럭트는 -> 벨류 타입 전부다 복사
 이것이 한줄요약이다
 한걸음더 한다면
 벨류 타입-> 매번 복사가 일어난다.
 값을 이동할때마다 복사가 된다 전달할때마다 복사가된다 전체복사
 
 클래스는 값을 전달할때마다 주소값만 전달된다.
 스트럭트는 a에서 바꿔도 bcd에서 안바낀다
 클래스는 바뀐다.
 
 레이블 -> 클래스
 model -> struct
 viewcontollre -> class
 복사하는건 클래스가 빠르다
 
 스택과 힙중에는 스택이 빠르다
 클래스는 힙 저장
 스트럭트는 스택 저장
 힙에 쓰기때문에 ARC 쓴다 ///왜 ARC가 쓰냐
 스트럭트는 ARC가 필요없다
 최대한 스트럭스쓰는게 좋다 빨라서
 
 왜 나머진 스트럭트는 쓰는게 좋냐 스트럭트는 스택에 저장되서 빨라서 한다.
 클래스는 힙에 저장해서 그렇다

 
 레퍼런스 카운트에 대해서 알아오기
 
 
 언노운드 레퍼런스 카운트 증가시키지않는다. count가 0 아 되면 nil로 만들어지지않는다.  클래쉬발생
 weak 레퍼런스 카운트 증가시키지않는다.  count가 0이 되면  nil로 만든다. 클래수 안발생
 strong 레퍼런슨 카운드 증가시킨다.
 
 */
