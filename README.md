# MATLABAIChallenge2023

figure 폴더안에는
fig_output이 reference로 사용되는 굴착기 버킷의 경로 그래프  
fig_predict가 아래 과정을 통해 만든 신경망을 이용해 생성한 굴착기 버킷의 경로 그래프 모음  
( 총 204개의 상황에 대해 각각의 파일 구성 )  

코드 실행 순서  
 1. get_abc  
 2. times_output  
 3. train_test_array  
 4. test_with_net  

----아래는 plot하는 과정---  
 5. plot_entire  
 6. plot_predict_entire  


note ) 학습에 사용된 Pointcloud Data 와 경로 Data 는 저희가 속한 연구실에서 사용되는 자료이기 때문에 첨부하지 않겠습니다.  

각 스크립트에 대한 설명
get_abc :  주어진 포인트클라우드 데이터의 3차원 좌표를 한 평면으로 정사영한 후, 2차원 곡선으로 피팅하여 2차원 곡선의 계수 a,b,c를 구하는 스크립트  
times_output : 신경망 학습에 사용할 배열의 형태로 갖고 있는 trajectory의 정보를 가공하는 스크립트  
train_test_array : Layer 및 Option을 설정한 후 신경망 학습을 진행하는 스크립트  
test_with_net : 학습된 신경망을 통해 경로를 생성하는 스크립트  
