package com.laputa.pdm.common.core.exception;



/**
 * 基础异常
 */
public class LaputaBaseException extends RuntimeException {

    private int errorCode;

    public LaputaBaseException() {
    }

    public LaputaBaseException(String message) {
        this(-1, message);
    }



    public LaputaBaseException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public LaputaBaseException(String message, Throwable cause) {
        super(message, cause);
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }
}
