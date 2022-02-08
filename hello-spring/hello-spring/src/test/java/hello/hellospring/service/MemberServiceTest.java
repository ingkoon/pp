package hello.hellospring.service;

import hello.hellospring.domain.Member;
import hello.hellospring.repository.MemberRepository;
import hello.hellospring.repository.MemoryMemberRepository;
import org.assertj.core.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

class MemberServiceTest {

    MemberService memberService;
    MemoryMemberRepository memberRepository;

    //각각의 함수 실행 전에 실행되는 함수로 저장소 할당 및 서비스 객체 할당에대한 실행이 이루어진다.
    @BeforeEach
    public void beforeEach(){
        memberRepository = new MemoryMemberRepository();
        memberService = new MemberService(memberRepository);
    }

    // 테스트 함수가 실행된 이후에 메모리를 해제하는 역할로 데이터의 중복을 피하기 위한 코드이다.
    @AfterEach
    public void afterEach(){
        memberRepository.clearStore();
    }

    //테스트함수는 편하게 읽게하기 위한 직관적인 네이밍이 허용된다고합니다?
    @Test
    void 회원가입() {
        //given
        Member member = new Member();
        member.setName("spring");

        //when
        Long saveId = memberService.join(member);

        //then
        Member findMember = memberService.findOne(saveId).get();
        assertThat(member.getName()).isEqualTo(findMember.getName());
    }

    @Test
    public void 중복_회원_예외(){
        //given
        Member member1 = new Member();
        member1.setName("spring");

        Member member2 = new Member();
        member2.setName("spring");

        //when
        memberService.join(member1);
        IllegalStateException e =  assertThrows(IllegalStateException.class, ()  -> memberService.join(member2));

        assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다.");
//        try {
//                memberService.join(member2);
//                fail();
//        }catch (IllegalStateException e){
//                assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다.");
//        }



        //then
    }

    @Test
    void 회원조회() {

    }

    @Test
    void findOne() {
    }
}