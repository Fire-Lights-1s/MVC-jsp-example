package com.oreilly.servlet.multipart;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.ServletInputStream;

public class PartInputStream extends FilterInputStream {
  private String boundary;
  
  private byte[] buf = new byte[65536];
  
  private int count;
  
  private int pos;
  
  private boolean eof;
  
  PartInputStream(ServletInputStream in, String boundary) throws IOException {
    super((InputStream)in);
    this.boundary = boundary;
  }
  
  private void fill() throws IOException {
    if (this.eof)
      return; 
    if (this.count > 0)
      if (this.count - this.pos == 2) {
        System.arraycopy(this.buf, this.pos, this.buf, 0, this.count - this.pos);
        this.count -= this.pos;
        this.pos = 0;
      } else {
        throw new IllegalStateException("fill() detected illegal buffer state");
      }  
    int read = 0;
    int boundaryLength = this.boundary.length();
    int maxRead = this.buf.length - boundaryLength - 2;
    while (this.count < maxRead) {
      read = ((ServletInputStream)this.in).readLine(this.buf, this.count, this.buf.length - this.count);
      if (read == -1)
        throw new IOException("unexpected end of part"); 
      if (read >= boundaryLength) {
        this.eof = true;
        for (int i = 0; i < boundaryLength; i++) {
          if (this.boundary.charAt(i) != this.buf[this.count + i]) {
            this.eof = false;
            break;
          } 
        } 
        if (this.eof)
          break; 
      } 
      this.count += read;
    } 
  }
  
  public int read() throws IOException {
    if (this.count - this.pos <= 2) {
      fill();
      if (this.count - this.pos <= 2)
        return -1; 
    } 
    return this.buf[this.pos++] & 0xFF;
  }
  
  public int read(byte[] b) throws IOException {
    return read(b, 0, b.length);
  }
  
  public int read(byte[] b, int off, int len) throws IOException {
    int total = 0;
    if (len == 0)
      return 0; 
    int avail = this.count - this.pos - 2;
    if (avail <= 0) {
      fill();
      avail = this.count - this.pos - 2;
      if (avail <= 0)
        return -1; 
    } 
    int copy = Math.min(len, avail);
    System.arraycopy(this.buf, this.pos, b, off, copy);
    this.pos += copy;
    total += copy;
    while (total < len) {
      fill();
      avail = this.count - this.pos - 2;
      if (avail <= 0)
        return total; 
      copy = Math.min(len - total, avail);
      System.arraycopy(this.buf, this.pos, b, off + total, copy);
      this.pos += copy;
      total += copy;
    } 
    return total;
  }
  
  public int available() throws IOException {
    int avail = this.count - this.pos - 2 + this.in.available();
    return (avail < 0) ? 0 : avail;
  }
  
  public void close() throws IOException {
    if (!this.eof)
      while (read(this.buf, 0, this.buf.length) != -1); 
  }
}

