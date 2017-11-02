package dynamusic;

import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import java.io.IOException;

public class QuizFormHandler extends GenericFormHandler {
    private String question;
    private String answer;
    private String userAnswer;
    private boolean correctAnswer;
    private String validateSuccessURL;
    private String validateErrorURL;
    
    public String getQuestion() {
        return question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }
    
    public String getAnswer() {
        return answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    public String getUserAnswer() {
        return userAnswer;
    }
    
    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }
    
    public boolean isCorrectAnswer() {
        return correctAnswer;
    }
    
    public void setCorrectAnswer(boolean correctAnswer) {
        this.correctAnswer = correctAnswer;
    }
    
    public String getValidateSuccessURL() {
        return validateSuccessURL;
    }
    
    public void setValidateSuccessURL(String validateSuccessURL) {
        this.validateSuccessURL = validateSuccessURL;
    }
    
    public String getValidateErrorURL() {
        return validateErrorURL;
    }
    
    public void setValidateErrorURL(String validateErrorURL) {
        this.validateErrorURL = validateErrorURL;
    }
    
    public boolean handleValidate(DynamoHttpServletRequest request, DynamoHttpServletResponse response) throws IOException {
        if (isLoggingDebug()) {
            logDebug("QuizFormHandler handleValidate method is invoked.");
        }
        
        if (getFormError()) {
            if (getValidateErrorURL() != null) {
                response.sendLocalRedirect(getValidateErrorURL(), request);
                return false;
            }
            return true;
        }
        
        correctAnswer = answer.equalsIgnoreCase(userAnswer);
        
        if (validateSuccessURL != null) {
            response.sendLocalRedirect(validateSuccessURL, request);
            return false;
        }
        
        return true;
    }
    
    @Override
    public boolean handleCancel(DynamoHttpServletRequest request, DynamoHttpServletResponse response) {
        if (isLoggingDebug()) {
            logDebug("QuizFormHandler handleCancel method is invoked.");
        }
        
        userAnswer = null;
        return true;
    }
}
