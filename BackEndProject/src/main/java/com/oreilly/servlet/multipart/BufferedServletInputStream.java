package com.oreilly.servlet.multipart;

import java.io.IOException;

import jakarta.servlet.ReadListener;
import jakarta.servlet.ServletInputStream;

public class BufferedServletInputStream extends ServletInputStream {
  private ServletInputStream in;
  
  private byte[] buf = new byte[65536];
  
  private int count;
  
  private int pos;
  
  public BufferedServletInputStream(ServletInputStream in) {
    this.in = in;
  }
  
  private void fill() throws IOException {
    int i = this.in.read(this.buf, 0, this.buf.length);
    if (i > 0) {
      this.pos = 0;
      this.count = i;
    } 
  }
  
  public int readLine(byte[] b, int off, int len) throws IOException {
    int total = 0;
    if (len == 0)
      return 0; 
    int avail = this.count - this.pos;
    if (avail <= 0) {
      fill();
      avail = this.count - this.pos;
      if (avail <= 0)
        return -1; 
    } 
    int copy = Math.min(len, avail);
    int eol = findeol(this.buf, this.pos, copy);
    if (eol != -1)
      copy = eol; 
    System.arraycopy(this.buf, this.pos, b, off, copy);
    this.pos += copy;
    total += copy;
    while (total < len && eol == -1) {
      fill();
      avail = this.count - this.pos;
      if (avail <= 0)
        return total; 
      copy = Math.min(len - total, avail);
      eol = findeol(this.buf, this.pos, copy);
      if (eol != -1)
        copy = eol; 
      System.arraycopy(this.buf, this.pos, b, off + total, copy);
      this.pos += copy;
      total += copy;
    } 
    return total;
  }
  
  private static int findeol(byte[] b, int pos, int len) {
    int end = pos + len;
    int i = pos;
    while (i < end) {
      if (b[i++] == 10)
        return i - pos; 
    } 
    return -1;
  }
  
  public int read() throws IOException {
    if (this.count <= this.pos) {
      fill();
      if (this.count <= this.pos)
        return -1; 
    } 
    return this.buf[this.pos++] & 0xFF;
  }
  
  public int read(byte[] b, int off, int len) throws IOException {
    int total = 0;
    while (total < len) {
      int avail = this.count - this.pos;
      if (avail <= 0) {
        fill();
        avail = this.count - this.pos;
        if (avail <= 0) {
          if (total > 0)
            return total; 
          return -1;
        } 
      } 
      int copy = Math.min(len - total, avail);
      System.arraycopy(this.buf, this.pos, b, off + total, copy);
      this.pos += copy;
      total += copy;
    } 
    return total;
  }

@Override
public boolean isFinished() {
	// TODO Auto-generated method stub
	return false;
}

@Override
public boolean isReady() {
	// TODO Auto-generated method stub
	return false;
}

@Override
public void setReadListener(ReadListener arg0) {
	// TODO Auto-generated method stub
	
}
}

