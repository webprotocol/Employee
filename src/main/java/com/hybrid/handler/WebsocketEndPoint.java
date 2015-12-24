package com.hybrid.handler;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
  
// 서버단의 WebSocketEndPoint 정의
// Websocket에서 서버단의 프로세스를 정의할 수 있다
// xml에 설정안하고 @ServerEndpoint(path) 로 정의할 수 있다고 알고 있다.
public class WebsocketEndPoint extends TextWebSocketHandler {
     
	static Log log = LogFactory.getLog(WebsocketEndPoint.class);
	
    // 접속하는 사용자에 대한 세션을 보관하기 위해 정의
    private List<WebSocketSession> clients;
  
    public WebsocketEndPoint() {
        super();
        clients = new ArrayList<WebSocketSession>();
    }
  
    // 클라이언트에서 접속을 하여 성공할 경우 발생하는 이벤트
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        super.afterConnectionEstablished(session);
        System.out.println("Session Connected");
         
        log.info("id = " + session.getId());
        // 메시지 발송을 위해 세션목록에 추가한다.
        clients.add(session);
    }
  
    // 클라이언트에서 send를 이용해서 메시지 발송을 한 경우 이벤트 핸들링
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
        String payloadMessage = message.getPayload();
        log.info("payloadMessage = " + payloadMessage);
         
        for (WebSocketSession client : clients) {
            client.sendMessage(new TextMessage("ECHO : " + payloadMessage));
        }
    }
  
    // 클라이언트에서 연결을 종료할 경우 발생하는 이벤트
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        System.out.println("Closed");
        // 메시지 발송 제외를 위해 세션목록에서 삭제한다.
        clients.remove(session);
    }
     
}